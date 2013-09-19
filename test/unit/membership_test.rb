require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:organization)
  should belong_to(:participant)
  should have_many(:checkouts)
  should have_many(:tools).through(:checkouts)
  

  # Validations

  # Scopes

  # Methods

end
