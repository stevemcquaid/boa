require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:participant)
  should belong_to(:organization)
  should belong_to(:tool)
  
  # Validations

  # Scopes

  # Methods

end