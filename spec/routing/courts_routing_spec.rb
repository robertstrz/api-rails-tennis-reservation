require "rails_helper"

RSpec.describe CourtsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courts").to route_to("courts#index")
    end

    it "routes to #new" do
      expect(:get => "/courts/new").to route_to("courts#new")
    end

    it "routes to #show" do
      expect(:get => "/courts/1").to route_to("courts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/courts/1/edit").to route_to("courts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/courts").to route_to("courts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/courts/1").to route_to("courts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courts/1").to route_to("courts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/courts/1").to route_to("courts#destroy", :id => "1")
    end

  end
end
