require 'rails_helper'

RSpec.describe "Courts", type: :request do
  describe "GET /courts" do
    it "works! (now write some real specs)" do
      get courts_path
      expect(response).to have_http_status(200)
    end
  end
end
