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
    true
  end

  def destroy?
    true
  end
end
