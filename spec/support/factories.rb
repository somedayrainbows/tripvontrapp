FactoryGirl.define do

  factory :experience do
    title
    description
    cost 25
    city "Denver"
  end

  sequence :title do |n|
    "#{n} title"
  end

  sequence :description do |n|
    "#{n} description"
  end


#alias for specific kinds of factories

  factory :category do
    name
    
  end

  sequence :name do |n|
    "#{n} name"
  end



end
