require "spec_helper"

describe "Update post" do
  it "to database should be succes" do
    post = create(:post, title: "Test update")
    page.driver.browser.basic_authorize('dhh', 'secret')
    visit new_post_path
    fill_in "post_title", with: "Cucamonga"
    fill_in "post_text", with: "uCBHYTgygutddldffoadsoi"
    find("input[type='submit']").click
    Post.where(title: "Cucamonga").count.should == 1
  end
  it "should validate title and text length" do
    page.driver.browser.basic_authorize('dhh', 'secret')
    visit new_post_path
    fill_in "post_title", with: "Test"
    fill_in "post_text", with: ""
    find("input[type='submit']").click
    page.has_css?('error_explanation')
  end
end
