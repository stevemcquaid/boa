require 'test_helper'

class AbilityTest < ActiveSupport::TestCase

  context "With a proper context, " do
    setup do
      create_context
    end

    teardown do
      remove_context
    end

    should "admin can manage everything" do

    end
  end
end
