require 'spec_helper'

describe "The Page: FAQs" do
  before :each do
    #Mocking
    @user = User.new
    @user.email = "organization@boa.com"
    @user.password = "testtest"
    @user.password_confirmation = "testtest"
    @user.name = "Test User"
    @user.add_role :admin
    @user.save  

    #let(:authed_user) { create_logged_in_user }

  end

  after :each do
    @user.destroy
    Warden.test_reset! 
  end
  

  describe "GET /faqs" do
    it "shows basic FAQs" do
   	  login_as @user, scope: :user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/faqs'
      save_and_open_page
      expect(page).to have_content 'FAQs'
      expect(page).to have_content 'What is Booth?'
      expect(page).to have_content 'UC Info Desk'
    end
  end

end