require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  context "With a refreshed ldap cache, " do
    setup do
      create_context
      @jonathan.send(:update_cache)
    end

    teardown do
      remove_context
    end
    

    should "check that student object is the same object as the Participant lookup via card number (This depends on the idcard lookup working)" do
      assert_equal @jonathan, Participant.find_by_andrew(811825505)
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

  end
end
