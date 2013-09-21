namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    if (!Rails.env.development?)
      puts "Environment wasn't developement"
      return
    end

    puts "clearing out data in database..."
    # Invoke rake db:migrate just in case...
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    

    # clear out old data in the database and reset the id sequences to 1 on each run of the populator
    [Charge, ChargeType, Checkout, Diagram, Faq, Membership, Organization, OrganizationAlias, OrganizationCategory, Participant, Role, Shift, ShiftParticipant, ShiftType, Task, TaskStatus, Tool].each(&:delete_all)
    
    puts "adding new data to database..."
    puts
    puts "OrganizationCategory"
    puts

    organization_categories = ["Blitz", "Independent", "Fraternity", "Sorority"]

    organization_categories.each do |org_category|
      new_org_categories = OrganizationCategory.new
      new_org_categories.name = org_category
      new_org_categories.save!
    end

    
    puts
    puts "db populated!"
  end
end