class User < ApplicationRecord

  require "#{Rails.root}/lib/ConvertHelpers"

  BLOOD_TYPE_Z = 0.freeze
  BLOOD_TYPE_A = 1.freeze
  BLOOD_TYPE_B = 2.freeze
  BLOOD_TYPE_AB = 3.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_many :donations

  scope :donors, -> { includes(:donations).joins(:roles).where(roles: { name: Role::DONOR }) }

  def number_of_donations
    self.donations.finished.count
  end

  def self.search(search_params)
    return self.donors.by_name(search_params[:name]) if search_params[:complex].blank?

    complex_search(search_params)
  end

  def my_donations
    self.donations.ordered
  end

  def admin?
    self.role?(Role::ADMIN)
  end

  def donor?
    self.role?(Role::DONOR)
  end

  def role?(role_name)
    !!self.roles.find_by_name(role_name)
  end

  private

  def self.by_name(str)
    return self.donors if str.length == 0

    params = str.split
    params.map!(&:downcase)
    
    return self.none if params.length < 1 or params.length > 2
    return self.donors.where("lower(first_name) = ? or lower(last_name) = ?", params[0], params[0]) if params.length == 1

    self.donors.where("(lower(first_name) = ? and lower(last_name) = ?) or (lower(first_name) = ? and lower(last_name) = ?)", params[0], params[1], params[1], params[0]) 
  end

  def self.by_blood_type(blood_type)
    self.where(blood_type: blood_type)
  end

  def self.by_rh_factor(rh)
    self.where(rh: rh)
  end

  def self.by_age(age_start, age_end)
    self.where("birth_date BETWEEN ? AND ?", age_start, age_end)
  end

  def self.complex_search(params)
    res = self.donors
    return res if res.count.zero?

    res = res.by_blood_type(params[:blood_type]) unless params[:blood_type].blank?
    return res if res.count.zero?

    res = res.by_rh_factor(ConvertHelpers::string_to_bool params[:rh]) unless params[:rh].blank?
    return res if res.count.zero?

    res = res.by_age(ConvertHelpers::string_to_date_format(params[:age_start]), ConvertHelpers::string_to_date_format(params[:age_end])) unless params[:age_start].blank? or params[:age_end].blank?
    res
  end

end
