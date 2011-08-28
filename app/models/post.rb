class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  attr_accessible :title, :body

  validates_presence_of :user_id, :body, :title

  default_scope lambda {
    limit(10).
    order("created_at DESC")
  }
end
