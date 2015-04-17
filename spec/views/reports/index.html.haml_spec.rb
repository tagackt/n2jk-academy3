require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :user_id => 1,
        :body => "MyText"
      ),
      Report.create!(
        :user_id => 1,
        :body => "MyText"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
