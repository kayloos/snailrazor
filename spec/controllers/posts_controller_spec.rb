require "spec_helper"

describe PostsController do
  render_views

  it "should have the correct title" do
    get "index"
    response.should have_selector("title", :content => "Snailrazor - Posts")
  end
end
