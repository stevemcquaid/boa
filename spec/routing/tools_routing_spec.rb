require "spec_helper"

describe ToolsController do
  describe "routing" do

    it "routes to #index" do
      get("/tools").should route_to("tools#index")
    end

    it "routes to #new" do
      get("/tools/new").should route_to("tools#new")
    end

    it "routes to #show" do
      get("/tools/1").should route_to("tools#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tools/1/edit").should route_to("tools#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tools").should route_to("tools#create")
    end

    it "routes to #update" do
      put("/tools/1").should route_to("tools#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tools/1").should route_to("tools#destroy", :id => "1")
    end

  end
end
