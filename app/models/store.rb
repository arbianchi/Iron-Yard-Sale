class Store < ApplicationRecord
  has_many  :items
  has_many  :transactions

  belongs_to   :store_admin
  belongs_to   :user, :through => :store_admin

end
