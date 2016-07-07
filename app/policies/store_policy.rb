class StorePolicy < ApplicationPolicy

  def store_admin?
   store.admin == current_user.id 
  end

  def site_admin?
    user.admin
  end
end
