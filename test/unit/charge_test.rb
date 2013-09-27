require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:organization)
  should belong_to(:issuing_participant)
  should belong_to(:receiving_participant)
  should belong_to(:charge_type)

  # Validations

  # Methods
  context "With a proper context, " do
    setup do
      create_context
    end

    teardown do
      remove_context
    end

    should "show that all factories are properly created" do
      assert_equal 2, Charge.all.size
    end

      

      context "Testing charges" do
        should "know charges" do
          assert_equal ["Breaker trip", "Missed 10/2 meeting"], Charge.all.map{|e| e.description}
        end  
      end
  end
end