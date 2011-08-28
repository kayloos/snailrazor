Factory.define :user do |user|
  user.email                 "gryn@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :post do |post|
  post.title "LolSovz"
  post.body "Foo bar"
  post.association :user
end

Factory.define :comment do |comment|
  comment.author "Idiot Tobak"
  comment.body "Foo bar"
  comment.association :post
end
