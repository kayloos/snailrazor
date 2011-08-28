require 'spec_helper'

describe Comment do
  before(:each) do
    @user = Factory(:user)
    @post = Factory(:post, :user => @user)
    @attr = { :body => "This is a comment!", :author => "Plabs slabs dalaps", :post => @post }
  end

  it "should create a new instance given valid attributes" do
    Factory(:comment, :post => @post).should be_true
  end

  describe "post association" do
    before(:each) do
      @comment = Factory(:comment, @attr)
    end

    it "should have a post attribute" do
      @comment.should respond_to(:post)
    end

    it "should reference the right post" do
      @comment.post.should == @post
      @comment.post_id.should == @post.id
    end
  end

  describe "comment validations" do
    it "should not accept blank fields" do
      @post.comments.build(@attr.merge(:body => "")).should_not be_valid
      @post.comments.build(@attr.merge(:author => "")).should_not be_valid
      Post.new(:body => "Test", :title => "Test").should_not be_valid
    end

    it "should accept valid parameters" do
      @post.comments.build(@attr).should be_valid
    end
  end
end
