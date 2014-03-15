require "spec_helper"

describe "Index posts" do
  it "should be succes" do
    post = create(:post, title: "Test index 1")
    post = create(:post, title: "Test index 2")
    post = create(:post, title: "Test index 3")
    visit posts_path
    page.has_content?('Test index 1')
    page.has_content?('Test index 2')
    page.has_content?('Test index 3')
  end
end
