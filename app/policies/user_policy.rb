class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def pdf_certificate?
    user.donor? and myself?
  end

  def edit?
    update?
  end

  def update?
    (user.donor? and myself?) or user.admin?
  end

  def user_donations?
    (user.donor? and myself?) or (user.admin? and not myself?)
  end

  def myself?
    user.id == record.id
  end

  def donor_and_myself?
    user.donor? and myself?
  end

end
