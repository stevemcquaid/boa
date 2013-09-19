require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:organization)
  should belong_to(:issuing_participant)
  should belong_to(:receiving_participant)
  should belong_to(:charge_type)


  # Validations

  # Scopes

  # Methods

end