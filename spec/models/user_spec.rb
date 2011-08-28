require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end

  describe "post associations" do 
    before(:each) do
      @p1 = Factory(:post, :user => @user, :created_at => 1.day.ago)
      @p2 = Factory(:post, :user => @user, :created_at => 2.days.ago)
    end

    it "should have a posts attribute" do
      @user.should respond_to(:posts)
    end

    it "should display posts in correct order" do
      @user.posts.should == [@p1, @p2]
    end

    it "should destroy associated posts" do
      @user.destroy
      [@p1, @p2].each do |post|
        Post.find_by_id(post.id).should be_nil
      end
    end
  end
end
