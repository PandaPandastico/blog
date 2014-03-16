require "spec_helper"

describe "Create comment" do
  it "to database should be succes" do
    post = create(:post)
    page.driver.browser.basic_authorize('dhh', 'secret')
    visit new_post_path
    fill_in "post_title", with: "Cucamonga"
    fill_in "post_text", with: "uCBHYTgygutddldffoadsoi"
    find("input[type='submit']").click
    visit post_path(post)
    fill_in "comment_commenter", with: "commenter bot"
    fill_in "comment_body", with: "comment random"
    find("input[type='submit']").click
    Comment.where(commenter: "commenter bot").count.should == 1
  end
end
