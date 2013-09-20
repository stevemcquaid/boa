require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  # Relationships
  should have_many(:checkouts)
  should have_many(:participants).through(:checkouts)
  should have_many(:organizations).through(:checkouts)

  # Validations

  # Scopes

  # Methods

end
