require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # Relationships
  should have_many(:organizations).through(:memberships)
  should have_many(:shifts).through(:shift_participants)
  should have_many(:organizations).through(:memberships)
  should have_many(:checkouts)
  should have_many(:tools).through(:checkouts)
  should have_many(:memberships)
  should have_many(:shift_participants)

  # Validations

  # Scopes

  # Methods

end