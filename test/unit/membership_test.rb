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
  context "Testing memberships" do
    should "know booth chairs" do
      #assert_equal 1, Membership.booth_chairs.size
      assert_equal ["asteger"], Membership.booth_chairs.map{|e| e.participant.andrewid}
    end
        
    
  end



end
