require "spec_helper"

describe "Show post" do
  it "should be succes" do
    post = create(:post, title: "Test show")
    visit post_path(post)
    page.has_content?('Test show')
  end
end
