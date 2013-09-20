require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  # Relationships
  should have_many(:checkouts)
  should have_many(:participants).through(:checkouts)
  should have_many(:organizations).through(:checkouts)

  # Validations
  should validate_uniqueness_of(:barcode)
  should validate_uniqueness_of(:name)
  
  # Scopes

  # Methods

end
