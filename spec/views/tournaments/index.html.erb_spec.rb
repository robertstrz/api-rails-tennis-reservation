require 'rails_helper'

RSpec.describe "tournaments/index", type: :view do
  before(:each) do
    assign(:tournaments, [
      Tournament.create!(
        :title => "Title",
        :content => "MyText",
        :contact => "Contact",
        :author => "Author",
        :surface => "Surface"
      ),
      Tournament.create!(
        :title => "Title",
        :content => "MyText",
        :contact => "Contact",
        :author => "Author",
        :surface => "Surface"
      )
    ])
  end

  it "renders a list of tournaments" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Surface".to_s, :count => 2
  end
end
