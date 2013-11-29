# spec/support/request_helpers.rb
require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

module RequestHelpers
  def log_in_admin
    user = Factory.create(:user)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end