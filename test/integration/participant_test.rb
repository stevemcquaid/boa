require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  context "With a proper context, " do
    setup do
      create_context
    end

    teardown do
      remove_context
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

  end
end