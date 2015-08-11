require 'rails_helper'

RSpec.describe "tournaments/show", type: :view do
  before(:each) do
    @tournament = assign(:tournament, Tournament.create!(
      :title => "Title",
      :content => "MyText",
      :contact => "Contact",
      :author => "Author",
      :surface => "Surface"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Surface/)
  end
end
