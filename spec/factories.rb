FactoryGirl.define do
  factory :user
    email                 "gryn@example.com"
    password              "foobar"
    password_confirmation "foobar"
  end

  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :post do |post|
    title "LolSovz"
    body "Foo bar"
    association :user
  end

  factory :comment do |comment|
    author "Idiot Tobak"
    body "Foo bar"
    association :post
  end
end
