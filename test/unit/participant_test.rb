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
  should belong_to(:user)

  # Validations



  context "With a proper context, " do
    setup do
      create_context
    end

    teardown do
      remove_context
    end

    should "show that all factories are properly created" do
      assert_equal 6, Participant.all.size
    end

    context "Testing participants" do
      should "know participants" do
        assert_equal ["rcrown", "shannon1", "dcorwin", "asteger", "member", "juc"], Participant.all.map{|e| e.andrewid}
      end
    end
    
    should "properly set and return card number" do
      @jonathan.card_number=811825505
      assert_equal 811825505, @jonathan.card_number
      @jonathan.card_number=123456789
      assert_equal 123456789, @jonathan.card_number
    end
    
  end
end