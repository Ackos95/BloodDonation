class UserController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user

  # show user profile
  def show
  end

  def pdf_certificate
    render pdf: 'donor_pdf', layout: 'pdf'
  end

  # show edit user profile page (not all information)
  def edit
  end

  # update user profile
  def update
    @user.update(update_params)

    if @user.save
      flash[:notice] = "Izmene uspešno sačuvane"
      redirect_to user_profile_path(@user)
    else
      flash[:error] = "Neuspesan pokušaj izmena"
      redirect_to user_profile_path(@user)
    end
  end

  private

  # find user from params, or set current_user
  def set_user
    @user = User.find(params[:user_id]) unless params[:user_id].blank?
    @user ||= current_user

    authorize @user
    @user = @user.decorate
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone_num)
  end

end
