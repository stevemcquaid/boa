require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:organization)
  should belong_to(:participant)
  #should have_many(:checkouts)
  #should have_many(:tools).through(:checkouts)
  

  # Validations
  should validate_presence_of(:participant_id)
  should validate_presence_of(:organization_id)
  
  # Scopes

  # Methods

end
