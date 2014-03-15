# -*- coding: utf-8 -*-
require "spec_helper"

describe "Post create" do
  it "a new post" do
    page.driver.browser.basic_authorize('dhh', 'secret')
    visit new_post_path
    fill_in "post_title", with: "Cucamonga"
    fill_in "post_text", with: "uCBHYTgygutñddñldfñfoadsoi"
    find("input[type='submit']").click
    Post.where(title: "Cucamonga").count.should == 1
  end
end
