# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price_in_cents { Faker::Commerce.price }
    store
  end

  factory :store do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    #association :admin_id, factory: :user
    admin_id 1
    factory :store_with_items do

      ##transient do
      #  items_count 5
      #end

      after(:create) do |store, evaluator|
        create_list(:item, 5, store: store)
      end
    end
  end
end
