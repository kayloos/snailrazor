namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    User.create(:email => "admin@example.com", :password => "foobar", :password_confirmation => "foobar")
    50.times do
      User.first.posts.create!(:body => Faker::Lorem.sentence(20), :title => Faker::Lorem.sentence(2))
    end
  end
end
