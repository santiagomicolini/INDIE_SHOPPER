class ProductPolicy < ApplicationPolicy
  class Scope < Scope
  end
  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.shop.user == user
  end

  def destroy?
    record.shop.user == user
  end
end
