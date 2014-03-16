require "spec_helper"

describe "Show post" do
  it "should be succes" do
    post = create(:post, title: "Test show")
    visit post_path(post)
    page.has_content?('Test show')
  end
  it "should has post comments" do
    post = create(:post)
    3.times{create(:comment, post: post)}
    visit post_path(post)
    post.comments.each do |n|
      page.has_content? n.commenter
      page.has_content? n.body
    end
  end
end
