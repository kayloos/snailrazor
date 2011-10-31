FactoryGirl.define do
  factory :user do
    email                 "gryn@example.com"
    password              "foobar"
    password_confirmation "foobar"
  end

  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :post do
    title "LolSovz"
    body "Foo bar"
    association :user
  end

  factory :comment do
    author "Idiot Tobak"
    body "Foo bar"
    association :post
  end
end
