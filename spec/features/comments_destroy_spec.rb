require "spec_helper"

describe "Destroy comment" do
  it "from database should be succes" do
    comment = create(:comment)
    visit post_path(comment.post)
    page.driver.browser.basic_authorize('dhh', 'secret')
    find("a[href=\"#{post_comment_path(comment.post,comment)}\"]").click
    Comment.where(commenter: comment.commenter).count.should == 0
  end
  it "to database should not be succes" do
    comment = create(:comment)
    visit post_path(comment.post)
    find("a[href=\"#{post_comment_path(comment.post,comment)}\"]").click
    page.should have_no_css('h2')
  end
end
