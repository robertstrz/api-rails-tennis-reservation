require 'rails_helper'

RSpec.describe "courts/index", type: :view do
  before(:each) do
    assign(:courts, [
      Court.create!(
        :city => "",
        :court_number => 1,
        :surface => "Surface"
      ),
      Court.create!(
        :city => "",
        :court_number => 1,
        :surface => "Surface"
      )
    ])
  end

  it "renders a list of courts" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Surface".to_s, :count => 2
  end
end
