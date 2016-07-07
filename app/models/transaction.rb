class Transaction < ApplicationRecord
  belongs_to    :store
  belongs_to    :user, foreign_key: "buyer_id"
  has_many    :items

end
