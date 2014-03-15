# -*- coding: utf-8 -*-
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
end
