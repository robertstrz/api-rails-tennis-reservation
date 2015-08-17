require 'rails_helper'

RSpec.describe "courts/edit", type: :view do
  before(:each) do
    @court = assign(:court, Court.create!(
      :city => "",
      :court_number => 1,
      :surface => "MyString"
    ))
  end

  it "renders the edit court form" do
    render

    assert_select "form[action=?][method=?]", court_path(@court), "post" do

      assert_select "input#court_city[name=?]", "court[city]"

      assert_select "input#court_court_number[name=?]", "court[court_number]"

      assert_select "input#court_surface[name=?]", "court[surface]"
    end
  end
end
