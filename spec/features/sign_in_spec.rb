require 'spec_helper'
include Devise::TestHelpers

describe "The signin process", :type => :feature do

    it "signs me in using form" do
      user = User.create(:email    => "test@boa.com",
                       :password => "testtest")
      visit 'users/sign_in'
      within("#new_user") do
        fill_in 'user_email', :with => 'test@boa.com'
        fill_in 'user_password', :with => 'testtest'
      end

      click_button 'sign_in'
      expect(page).to have_content 'Success'
    end


    describe "sets session data" do
      let(:authed_user) { create_logged_in_user }

      it "should allow access" do
        visit user_path(authed_user)
        # should be good!
      end
    end

  end