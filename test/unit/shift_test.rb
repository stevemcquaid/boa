require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:organization)
  should have_many(:participants).through(:shift_participants)
  should have_many(:shift_participants)
  should belong_to(:shift_type)

  # Validations
  should validate_presence_of(:organization_id)
  should validate_presence_of(:starts_at)
  should validate_presence_of(:ends_at)
  should validate_presence_of(:required_number_of_participants)
 
  # Scopes

  # Methods

end
