require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :user_id => 1,
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
