require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :user_id => 1,
      :body => "MyText",
      :resource_id => 1,
      :resource_type => "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_resource_id[name=?]", "comment[resource_id]"

      assert_select "input#comment_resource_type[name=?]", "comment[resource_type]"
    end
  end
end
