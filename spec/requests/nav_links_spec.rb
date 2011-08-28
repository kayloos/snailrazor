require 'spec_helper'
describe "NavLinks" do
  describe "GET /nav_links" do
    it "home should link to root_path" do
=begin
      visit root_path
      click_link "Home"
      current_page.url.should == root_path
=end
    end
  end
end
