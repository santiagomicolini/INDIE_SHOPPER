class ShopPolicy < ApplicationPolicy
  class Scope < Scope
  end
  def show?
    true
  end

  def create?
    true
  end

  def my_shop?
    record.user == user
  end


  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
