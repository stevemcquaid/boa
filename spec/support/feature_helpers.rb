# spec/support/feature_helpers.rb
require 'spec_helper'
include Warden::Test::Helpers
include Devise::TestHelpers

#Warden.test_mode!

module FeatureHelpers
  def create_logged_in_user
    user = Factory(:user)

    # Only required if using the confirmable module
	# user.confirmed_at = Time.now
	# user.save
	
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end