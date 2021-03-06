class ActivityCostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.group.user || user.admin
  end
end
