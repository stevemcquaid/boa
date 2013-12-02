require 'spec_helper'

describe "Presentation" do
  before :each do
    #Mocking User and Participants Objects for tests

    #Mocks for SEC Admin
    @admin = User.new
    @admin.email = "organization@boa.com"
    @admin.password = "testtest"
    @admin.password_confirmation = "testtest"
    @admin.name = "Test User"
    @admin.add_role :admin
    @admin.save

    #Mocks for Booth Chair


    #Mocks for Member of Student Org



    #let(:authed_user) { create_logged_in_user }

  end

  after :each do
    @admin.destroy
    Warden.test_reset! 
  end

  describe "Tool Checkout" do
    it "can checkout existing tool with set id card swipe" do
      login_as @admin, scope: :user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/organizations'
      expect(page).to have_content 'Organizations'
    end

    it "checkout non-existing tool with id card swipe" do
      login_as @admin, scope: :user
    end
  end #End of Tool Checkout

  describe "Shift Check In" do
    it "can check in with id card swipe" do
      login_as @admin, scope: :user
    end
  end

  describe "Add new participant" do
    it "can add new participant with id card swipe" do
      login_as @admin, scope: :user
    end
  end #end of Add Participant

  describe "Organization Dashboard" do
    it "for booth chair" do
      it "can see fines for own org" do 
        login_as @admin, scope: :user

      end

      it "can see members for own org" do 
        login_as @admin, scope: :user

      end

    end

    it "for SEC admin" do
      it "see fines for all orgs" do 
        login_as @admin, scope: :user

      end

      it "can see members for all org" do 
        login_as @admin, scope: :user

      end

    end

    it "for member of student org" do
      it "can see booth chairs" do 
        login_as @admin, scope: :user

      end

      it "can booth chairs' phone numbers" do 
        login_as @admin, scope: :user

      end

    end
  end 

end

  