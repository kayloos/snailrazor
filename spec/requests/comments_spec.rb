require "spec_helper"

describe "Comments" do
  before(:each) do
    @post = Factory(:post)
  end

  describe "creation" do
    describe "success" do
      it "should create a comment given valid parameters" do
        lambda do
          visit post_path(@post)
          fill_in "comment_body",   :with => "Witty comment"
          fill_in "comment_author", :with => "Snizz FizzGewinks"
          click_button
          response.should render_template("posts/show")
          response.should have_selector("div.success")
        end.should change(Comment, :count).by(1) 
      end
    end

    describe "failure" do
      it "should not create a comment given invalid parameters" do
        lambda do
          visit post_path(@post)
          fill_in "comment_body",   :with => ""
          fill_in "comment_author", :with => ""
          click_button
          response.should render_template("posts/show")
          response.should have_selector("div.error")
        end.should_not change(Comment, :count)
      end
    end
  end
end
