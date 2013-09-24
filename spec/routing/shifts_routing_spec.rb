require "spec_helper"

describe ShiftsController do
  describe "routing" do

    it "routes to #index" do
      get("/shifts").should route_to("shifts#index")
    end

    it "routes to #new" do
      get("/shifts/new").should route_to("shifts#new")
    end

    it "routes to #show" do
      get("/shifts/1").should route_to("shifts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shifts/1/edit").should route_to("shifts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shifts").should route_to("shifts#create")
    end

    it "routes to #update" do
      put("/shifts/1").should route_to("shifts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shifts/1").should route_to("shifts#destroy", :id => "1")
    end

  end
end
