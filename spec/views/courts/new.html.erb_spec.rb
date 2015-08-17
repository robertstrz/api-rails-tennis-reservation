require 'rails_helper'

RSpec.describe "courts/new", type: :view do
  before(:each) do
    assign(:court, Court.new(
      :city => "",
      :court_number => 1,
      :surface => "MyString"
    ))
  end

  it "renders new court form" do
    render

    assert_select "form[action=?][method=?]", courts_path, "post" do

      assert_select "input#court_city[name=?]", "court[city]"

      assert_select "input#court_court_number[name=?]", "court[court_number]"

      assert_select "input#court_surface[name=?]", "court[surface]"
    end
  end
end
