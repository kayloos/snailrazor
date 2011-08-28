require "spec_helper"

describe "Posts" do
  before(:each) do
    user = Factory(:user)
    visit new_user_session_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do
      it "should not make a new post" do
        lambda do
          visit new_post_path
          fill_in :post_title, :with => ""
          fill_in :post_body,  :with => ""
          click_button
          response.should render_template("devise/sessions/new")
          response.should have_selector("div.error")
        end.should_not change(Post, :count)
      end
    end

    describe "success" do
      it "should make a new post" do
        lambda do
          visit new_post_path
          fill_in :post_title, :with => "Title"
          fill_in :post_body, :with => "Content"
          click_button
          response.should render_template("posts/index")
          response.should have_selector("div.success")
        end.should change(Post, :count).by(1)
      end
    end
  end
end
