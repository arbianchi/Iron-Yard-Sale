class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :store
  has_one :store, :through          => :store_admins

  has_many :transactions

  has_many :watched_items
  has_many :items, :through         => :watched_items
end
