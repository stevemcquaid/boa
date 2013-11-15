namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :popInit => :environment do
    puts "Clearing out data in database..."
    # Invoke rake db:migrate just in case...
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    
    # clear out old data in the database and reset the id sequences to 1 on each run of the populator
    #was getting a "Could not find table 'task_statuses'" error... comented out
    #objs = [Charge, ChargeType, Checkout, Document, Faq, Membership, Organization, OrganizationAlias, OrganizationCategory, Participant, Role, Shift, ShiftParticipant, ShiftType, Task, TaskStatus, TaskCategory, Tool]
    #objs.try(:each){|i| i.delete_all}
    
    Rake::Task['db:migrate'].invoke

    
    #Seed tools
    require_relative ('../../db/tool_seed.rb')
    generate_tools
    
    
    puts "Adding new data to database..."
    puts
    puts "OrganizationCategory"

    organization_categories = ["Blitz", "Independent", "Fraternity", "Sorority"]

    organization_categories.each do |org_category|
      new_org_categories = OrganizationCategory.new
      new_org_categories.name = org_category
      new_org_categories.save!
    end

    puts "ChargeType"

    new_charge_type = ChargeType.new
    new_charge_type.default_amount = 100.00
    new_charge_type.description = "Missed a meeting"
    new_charge_type.name = "Meeting"
    new_charge_type.requires_booth_chair_approval = false
    new_charge_type.save!

    new_charge_type = ChargeType.new
    new_charge_type.default_amount = 200.00
    new_charge_type.description = "Tripped a breaker"
    new_charge_type.name = "Breaker"
    new_charge_type.requires_booth_chair_approval = true
    new_charge_type.save!


    puts "TaskStatus"

    new_task_status = TaskStatus.new
    new_task_status.name = "Complete"
    new_task_status.save!

    new_task_status = TaskStatus.new
    new_task_status.name = "Incomplete"
    new_task_status.save!

    new_task_status = TaskStatus.new
    new_task_status.name = "In Progress"
    new_task_status.save!


    puts "ShiftType"

    new_shift_type = ShiftType.new
    new_shift_type.name = "Watch Shift"
    new_shift_type.save!

    new_shift_type = ShiftType.new
    new_shift_type.name = "Security Shift"
    new_shift_type.save!

    new_shift_type = ShiftType.new
    new_shift_type.name = "Ride Shift"
    new_shift_type.save!


    puts
    puts "DB Init Complete!"
  end
end
