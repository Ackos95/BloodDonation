class Role < ApplicationRecord

  ADMIN = 1
  DONOR = 2

  has_and_belongs_to_many :users

  def self.admin
    Role.find_by_name(ADMIN)
  end

  def self.donor
    Role.find_by_name(DONOR)
  end
end
