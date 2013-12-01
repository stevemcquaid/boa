# spec/support/feature_helpers.rb
require 'spec_helper'
include Warden::Test::Helpers

#Warden.test_mode!

module FeatureHelpers
  # def create_logged_in_user
  #   #Mocking
  #   user = User.new
  #   user.email = "test@boa.com"
  #   user.password = "testtest"
  #   user.password_confirmation = "testtest"
  #   user.name = "Test User"
  #   user.add_role :admin
  #   user.save

  #   # Only required if using the confirmable module
  # 	# user.confirmed_at = Time.now
  # 	# user.save
	
  #   self.login(user)
  #   user
  # end

  # def login(user)
  #   login_as user, scope: :user
  # end
end