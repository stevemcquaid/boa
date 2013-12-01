require 'spec_helper'

describe "Organizations" do
  # describe "sets session data" do
  #   let(:authed_user) { create_logged_in_user }

  #   it "should allow access" do
  #     visit user_path(authed_user)
  #     # should be good!
  #   end
  # end

  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/organizations'
      expect(page).to have_content 'Organizations'
    end
  end

end