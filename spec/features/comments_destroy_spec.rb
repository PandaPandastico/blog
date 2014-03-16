require "spec_helper"

describe "Destroy comment" do
  it "from database should be succes" do
    comment = create(:comment)
    visit post_path(comment.post)
    find("a[href=\"#{post_comment_path(comment.post,comment)}\"]").click
    Comment.where(commenter: "commenter bot").count.should == 0
  end
end
