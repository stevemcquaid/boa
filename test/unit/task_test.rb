require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:task_status)
  should belong_to(:completed_by) #need something about Participants here? See model...

  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:due_at)
  should validate_presence_of(:task_status_id)

  context "With a proper context, " do
    setup do
      create_context
    end

    teardown do
      remove_context
    end

    should "show that all factories are properly created" do
      assert_equal 3, Task.all.size
    end
   
    # Scopes

    # Methods

  end
end