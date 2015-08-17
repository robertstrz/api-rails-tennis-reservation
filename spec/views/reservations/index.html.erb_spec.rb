require 'rails_helper'

RSpec.describe "reservations/index", type: :view do
  before(:each) do
    assign(:reservations, [
      Reservation.create!(
        :court => "",
        :user => ""
      ),
      Reservation.create!(
        :court => "",
        :user => ""
      )
    ])
  end

  it "renders a list of reservations" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
