require "spec_helper"

describe "Delete post" do
  it "from database should be succes" do
    post = create(:post, title: "Test delete")
    page.driver.browser.basic_authorize('dhh', 'secret')
    visit posts_path
    page.all("a[href=\"#{post_path(post)}\"]")[1].click
    Post.where(title: "Test delete").count.should == 0
  end
  it "to database should not be succes" do
    post = create(:post, title: "Test delete")
    page.driver.browser.basic_authorize('fake', 'test')
    visit posts_path
    page.all("a[href=\"#{post_path(post)}\"]")[1].click
    page.should have_no_css('h2')
  end
end
