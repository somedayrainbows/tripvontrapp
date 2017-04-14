FactoryGirl.define do

  factory :experience do
    title
    description
    cost 25
    city "Denver"
    image_path "image"
    categories { create_list(:category, 2) }
  end

#creating factories with associations in the docs
  sequence :title do |n|
    n
  end

  sequence :description do |n|
    n
  end


  factory :category do
    name
  end

  sequence :name do |n|
    n
  end

  factory :user do |n|
    name
    email
    password "password"
    role 0
    factory :user_with_orders do |n|
      orders {create_list(:order, 2)}
    end
  end

  # sequence :name do |n|
  #   n
  # end

  sequence :email do |n|
    "person#{n}@awesome.com"
  end

  factory :order do |n|
    sequence(:status) { |n| "#{n} status" }
    total_price 10
    user
  end

end
