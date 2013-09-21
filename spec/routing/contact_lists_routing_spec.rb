require "spec_helper"

describe ContactListsController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_lists").should route_to("contact_lists#index")
    end

    it "routes to #new" do
      get("/contact_lists/new").should route_to("contact_lists#new")
    end

    it "routes to #show" do
      get("/contact_lists/1").should route_to("contact_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_lists/1/edit").should route_to("contact_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_lists").should route_to("contact_lists#create")
    end

    it "routes to #update" do
      put("/contact_lists/1").should route_to("contact_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_lists/1").should route_to("contact_lists#destroy", :id => "1")
    end

  end
end
