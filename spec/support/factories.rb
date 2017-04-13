FactoryGirl.define do

  factory :experience do
    title
    description
    cost 25
    city "Denver"
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
    role 1
  end
  # 
  # sequence :name do |n|
  #   n
  # end

  sequence :email do |n|
    "person#{n}@awesome.com"
  end

end
