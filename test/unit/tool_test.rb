require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  # Relationships
  should have_many(:checkouts)
  should have_many(:participants).through(:checkouts)
  should have_many(:organizations).through(:checkouts)

  # Validations
  validates_uniqueness_of(:barcode)
  validates_uniqueness_of(:name)
  # Scopes

  # Methods

end
