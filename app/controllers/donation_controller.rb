class DonationController < ApplicationController

  require "#{Rails.root}/lib/ConvertHelpers"

  before_action :authenticate_user!
  before_action :set_user, only: [:user_donations]
  before_action :set_donation, only: [:check]

  # see all donations (ADMIN)
  def index
    authorize :donation
    @donations = Donation.ordered.decorate
  end

  def for_check
    authorize :donation
    @donations = Donation.before_now.for_check.decorate
  end

  # see donations for specific user (DONOR, ADMIN)
  def user_donations
    @donations = @user.my_donations.decorate
  end

  # create new donation (DONOR) (schedule will actually create donation in future time)
  def create
    authorize(current_user, :donor_and_myself?)
    donation = Donation.new timestamp: donation_timestamp, user: current_user

    if donation.save
      flash[:notice] = "Uspešno ste zakazali termin #{donation.decorate.date_to_human}"
      redirect_to my_profile_path
    else
      flash[:error] = donation.errors[:timestamp].length ? donation.errors[:timestamp][0] : "Nepoznata greska, pokusajte kasnije."
      redirect_back(fallback_location: my_profile_path)
    end
  end

  # mark donation as show/no-show (ADMIN)
  def check
    authorize :donation
    @donation.check(ConvertHelpers::string_to_bool params[:shown])

    if @donation.save
      flash[:notice] = "Uspešno ažuriranje"
      redirect_to donations_for_check_path
    else
      flash[:error] = "Došlo je do greške, pokušajte ponovo"
      redirect_to donations_for_check_path
    end
  end

  private

  # find user from parameter or set current_user
  def set_user
    @user = User.find(params[:user_id]) unless params[:user_id].blank?
    @user ||= current_user

    authorize(@user, :user_donations?)
    @user = @user.decorate
  end

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def check_params
    params.permit(:id, :shown)
  end

  def donation_timestamp
    ConvertHelpers::string_to_timestamp params[:timestamp]
  end

end
