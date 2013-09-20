require 'test_helper'

class ShiftTypeTest < ActiveSupport::TestCase
  # Relationships
  should have_many(:shifts)

  # Validations
  should validate_presence_of(:name)
 
  # Scopes

  # Methods

    #use factory girl to test uniqueness of name and dependent destroy

end