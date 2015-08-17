require 'rails_helper'

RSpec.describe "courts/show", type: :view do
  before(:each) do
    @court = assign(:court, Court.create!(
      :city => "",
      :court_number => 1,
      :surface => "Surface"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Surface/)
  end
end
