require 'spec_helper'

describe "Organizations" do
  before :each do
    #Mocking
    @user = User.new
    @user.email = "test@boa.com"
    @user.password = "testtest"
    @user.password_confirmation = "testtest"
    @user.name = "Test User"
    @user.add_role :admin
    @user.save!

    #let(:authed_user) { create_logged_in_user }

  end

  after :each do
    @user.destroy
    Warden.test_reset! 
  end

  # describe "sets session data" do
  #   let(:authed_user) { create_logged_in_user }

  #   it "should allow access" do
  #     visit user_path(authed_user)
  #     # should be good!
  #   end
  # end

  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      login_as @user, scope: :user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/organizations'
      expect(page).to have_content 'Organizations'
    end
  end

end