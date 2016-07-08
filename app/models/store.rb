class Store < ApplicationRecord
  has_many  :items
  has_many  :transactions
  has_many  :inventories

  belongs_to   :user

end
