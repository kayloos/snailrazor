require "spec_helper"

describe PagesController do
  render_views

  it "should respond correctly" do
    get "welcome"
    response.should be_success
  end
end
