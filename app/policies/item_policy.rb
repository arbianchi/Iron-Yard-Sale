class ItemPolicy < ApplicationPolicy

  def show?
    true
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    is_admin? || is_owner?
  end

  def destroy?
    is_admin? || is_user?
  end

  private

  def is_user?
    record.user == user
  end

  def is_owner?
    record.admin_id == user.id
  end

  def is_admin?
    unless user.nil?
      user.admin 
    end
  end
end
