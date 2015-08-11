require 'rails_helper'

RSpec.describe "tournaments/new", type: :view do
  before(:each) do
    assign(:tournament, Tournament.new(
      :title => "MyString",
      :content => "MyText",
      :contact => "MyString",
      :author => "MyString",
      :surface => "MyString"
    ))
  end

  it "renders new tournament form" do
    render

    assert_select "form[action=?][method=?]", tournaments_path, "post" do

      assert_select "input#tournament_title[name=?]", "tournament[title]"

      assert_select "textarea#tournament_content[name=?]", "tournament[content]"

      assert_select "input#tournament_contact[name=?]", "tournament[contact]"

      assert_select "input#tournament_author[name=?]", "tournament[author]"

      assert_select "input#tournament_surface[name=?]", "tournament[surface]"
    end
  end
end
