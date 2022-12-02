class BasketProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def create?
    record.basket.user == user
  end

  def destroy?
    record.basket.user == user
  end
end
