require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Relationships
  should belong_to(:task_status)
  should belong_to(:completed_by) #need something about Participants here? See model...

  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:due_at)
  should validate_presence_of(:task_status_id)
   
  # Scopes

  # Methods

end