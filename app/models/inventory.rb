class Inventory < ApplicationRecord
  has_many  :items
  belongs_to :store
end
