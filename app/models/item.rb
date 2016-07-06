class Item < ApplicationRecord
  belongs_to :store

  belongs_to :transactions

  belongs_to :inventory

  belongs_to :watched_items
  belongs_to :user 

  def price
    self.price_in_cents / 100
  end

end
