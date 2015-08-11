require 'rails_helper'

RSpec.describe "tournaments/edit", type: :view do
  before(:each) do
    @tournament = assign(:tournament, Tournament.create!(
      :title => "MyString",
      :content => "MyText",
      :contact => "MyString",
      :author => "MyString",
      :surface => "MyString"
    ))
  end

  it "renders the edit tournament form" do
    render

    assert_select "form[action=?][method=?]", tournament_path(@tournament), "post" do

      assert_select "input#tournament_title[name=?]", "tournament[title]"

      assert_select "textarea#tournament_content[name=?]", "tournament[content]"

      assert_select "input#tournament_contact[name=?]", "tournament[contact]"

      assert_select "input#tournament_author[name=?]", "tournament[author]"

      assert_select "input#tournament_surface[name=?]", "tournament[surface]"
    end
  end
end
