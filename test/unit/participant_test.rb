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

    should "do something relating to loading the student's information from cmu servers" do
      @jonathan.ldap_reference
      assert_equal @jonathan, Participant.find_by_card(811825505)
    end

    should "return name from directory" do
      assert_equal "Jonathan U Chung", @jonathan.name
    end

    should "return surname from directory" do
      assert_equal "Chung", @jonathan.surname
    end

    should "return email from directory" do
      assert_equal "jonathanc@cmu.edu", @jonathan.email
    end

    should "return department from directory" do
      assert_equal "Dietrich College Interdisciplinary", @jonathan.department
    end

    should "return student class from directory" do
      assert_equal "Senior", @jonathan.student_class
    end

    should "properly set and return card number from directory" do
      @jonathan.card_number=811825505
      assert_equal 811825505, @jonathan.card_number
      @jonathan.card_number=123456789
      assert_equal 123456789, @jonathan.card_number
    end

  end
end