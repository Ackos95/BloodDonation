class DonationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.admin?
  end

  def for_check?
    user.admin?
  end

  def check?
    user.admin?
  end

end
