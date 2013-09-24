require "spec_helper"

describe ShiftParticipantsController do
  describe "routing" do

    it "routes to #index" do
      get("/shift_participants").should route_to("shift_participants#index")
    end

    it "routes to #new" do
      get("/shift_participants/new").should route_to("shift_participants#new")
    end

    it "routes to #show" do
      get("/shift_participants/1").should route_to("shift_participants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shift_participants/1/edit").should route_to("shift_participants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shift_participants").should route_to("shift_participants#create")
    end

    it "routes to #update" do
      put("/shift_participants/1").should route_to("shift_participants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shift_participants/1").should route_to("shift_participants#destroy", :id => "1")
    end

  end
end
