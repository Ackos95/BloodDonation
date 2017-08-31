class Auth::RegistrationsController < Devise::RegistrationsController

  def create
    super do |user|
      user.roles << Role.donor
    end
  end

end
