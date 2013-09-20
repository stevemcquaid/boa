require 'test_helper'

class ShiftParticipantTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:shift)
  should belong_to(:participant)

  # Validations
  should validate_presence_of(:shift_id)
  should validate_presence_of(:clocked_in_at)
  should validate_presence_of(:participant_id)
 
  # Scopes

  # Methods

end
