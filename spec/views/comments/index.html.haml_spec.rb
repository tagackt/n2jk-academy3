require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :user_id => 1,
        :body => "MyText",
        :resource_id => 2,
        :resource_type => "Resource Type"
      ),
      Comment.create!(
        :user_id => 1,
        :body => "MyText",
        :resource_id => 2,
        :resource_type => "Resource Type"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Resource Type".to_s, :count => 2
  end
end
