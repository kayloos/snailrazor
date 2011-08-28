require 'spec_helper'

describe Post do
  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "Post!", :body => "OQWEIJQW QWJEOI", :user => @user }
  end

  it "should create a new instance given valid attributes" do
    Factory(:post, @attr).should be_true
  end

  describe "user associations" do
    before(:each) do
      @post = Factory(:post, @attr)
    end

    it "should have a user attribute" do
      @post.should respond_to(:user)
    end

    it "should reference the right user" do
      @post.user.should == @user
      @post.user_id.should == @user.id
    end
  end

  describe "post validations" do
    it "should not accept an empty title, user association or body" do
      @user.posts.build(@attr.merge(:title => "")).should_not be_valid
      @user.posts.build(@attr.merge(:body => "")).should_not be_valid
    end

    it "should accept valid parameters" do
      Factory(:post, @attr).should be_valid
    end
  end
end
