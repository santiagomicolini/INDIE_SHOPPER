class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def create?
    record.user == user
  end

  def update?
    true
  end

  def qr_collected?
    true
  end
end
