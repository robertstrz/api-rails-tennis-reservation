require 'rails_helper'

RSpec.describe "reservations/new", type: :view do
  before(:each) do
    assign(:reservation, Reservation.new(
      :court => "",
      :user => ""
    ))
  end

  it "renders new reservation form" do
    render

    assert_select "form[action=?][method=?]", reservations_path, "post" do

      assert_select "input#reservation_court[name=?]", "reservation[court]"

      assert_select "input#reservation_user[name=?]", "reservation[user]"
    end
  end
end
