FactoryGirl.define do

  factory :experience do
    title
    description
    cost 25
    city "Denver"
    image_path "image"
    status "active"
    categories { create_list(:category, 2) }
  end

#creating factories with associations in the docs
  sequence :title do |n|
    "title#{n}"
  end

  sequence :description do |n|
    "description#{n}"
  end


  factory :category do
    name
  end

  sequence :name do |n|
    "name#{n}"
  end

  factory :user do
    name
    email
    password "password"
    role 0
    # factory :user_with_orders do
    #   experiences_orders {create_list(:experiences_order, 2)}
    # end
  end

  sequence :email do |n|
    "person#{n}@awesome.com"
  end

  factory :order do
    sequence(:status) { |n| "#{n} status" }
    total_price 10
    user
  end

  factory :experiences_order do
    quantity 1
    subtotal 2
    order
    experience
  end
end
