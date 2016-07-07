# Read about factories at https://github.com/thoughtbot/factory_girl
require 'pry'

FactoryGirl.define do
  factory :user do
    email       { Faker::Internet.email }
    password    "password"
  end

  factory :admin, parent: :user do
    admin true
  end
end
