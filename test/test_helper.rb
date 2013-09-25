require 'simplecov'
SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Views", "app/views"
end

require 'simplecov-rcov'
class SimpleCov::Formatter::MergedFormatter
  def format(result)
     SimpleCov::Formatter::HTMLFormatter.new.format(result)
     SimpleCov::Formatter::RcovFormatter.new.format(result)
  end
end
SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  def deny(condition)
    assert !condition
  end
  
  def create_context
    # Create 4 organization categories
    @blitz = FactoryGirl.create(:organization_category, :name => "Blitz")
    @independent = FactoryGirl.create(:organization_category, :name => "Independent")
    @frat = FactoryGirl.create(:organization_category, :name => "Fraternity")
    @sorority = FactoryGirl.create(:organization_category, :name => "Sorority")

    # Create 3 organizations
    @theta = FactoryGirl.create(:organization, :name => "Kappa Alpha Theta", :organization_category => @sorority)
    @sdc = FactoryGirl.create(:organization, :name => "Student Dormitory Council", :organization_category => @independent)
    @scc = FactoryGirl.create(:organization, :name => "Spring Carnival Committee", :organization_category => @independent)

    # Create 3 organization aliases
    @theta_alias = FactoryGirl.create(:organization_alias, :name => "Theta", :organization => @theta)
    @sdc_alias = FactoryGirl.create(:organization_alias, :name => "SDC", :organization => @sdc)
    @scc_alias = FactoryGirl.create(:organization_alias, :name => "SCC", :organization => @scc)

    # Create 3 shift types
    @watch_shift = FactoryGirl.create(:shift_type)
    @security_shift = FactoryGirl.create(:shift_type, :name => "Security Shift")
    @ride_shift = FactoryGirl.create(:shift_type, :name => "Ride Shift")

    # Create 3 shifts
    @shift1 = FactoryGirl.create(:shift, :ends_at => Date.new, :required_number_of_participants => 3, :starts_at => Date.new, :organization => @theta)
    @shift2 = FactoryGirl.create(:shift, :ends_at => Date.new, :required_number_of_participants => 3, :starts_at => Date.new, :organization => @sdc)
    @shift3 = FactoryGirl.create(:shift, :ends_at => Date.new, :required_number_of_participants => 3, :starts_at => Date.new, :organization => @theta)
  
    # Create 4 participants
    @rachel = FactoryGirl.create(:participant)
    @shannon = FactoryGirl.create(:participant, :andrewid => "shannon1", :phone_number => 4124124124)
    @dylan = FactoryGirl.create(:participant, :andrewid => "dcorwin", :phone_number => 4121235555)
    @alexis = FactoryGirl.create(:participant, :andrewid => "asteger", :phone_number => 5391234124)

    @sp1 = FactoryGirl.create(:shift_participant, :participant => @rachel, :clocked_in_at => Date.new, :shift => @shift1)
    @sp2 = FactoryGirl.create(:shift_participant, :participant => @shannon, :clocked_in_at => Date.new, :shift => @shift2)
    @sp3 = FactoryGirl.create(:shift_participant, :participant => @alexis, :clocked_in_at => Date.new, :shift => @shift3)
    @sp4 = FactoryGirl.create(:shift_participant, :participant => @dylan, :clocked_in_at => Date.new, :shift => @shift3)
    
    # Create 2 memberships
    @member_rachel = FactoryGirl.create(:membership, :participant => @rachel, :organization => @scc)
    @member_alexis = FactoryGirl.create(:membership, :participant => @alexis, :organization => @theta, :booth_chair_order => 1, :is_booth_chair => true, :title => nil)

    # Create 2 charge types
    @miss_meeting = FactoryGirl.create(:charge_type, :default_amount => 100.00, :description => "Missed a meeting", :name => "Meeting", :requires_booth_chair_approval => false)
    @trip_breaker = FactoryGirl.create(:charge_type, :default_amount => 200.00, :description => "Tripped a breaker", :name => "Breaker", :requires_booth_chair_approval => true)

    # Create 2 charges
    @meeting_fine = FactoryGirl.create(:charge, :charge_type => @miss_meeting, :issuing_participant => @rachel, :receiving_participant => nil, :organization => @theta, :amount => 50.00, :charged_at => Date.today, :description => "Missed 10/2 meeting")
    @breaker_fine = FactoryGirl.create(:charge, :charge_type => @trip_breaker, :issuing_participant => @rachel, :receiving_participant => @alexis, :organization => @theta, :amount => 25.00, :charged_at => Date.today-1, :description => "Breaker trip")

    # Create 3 task statuses
    @complete = FactoryGirl.create(:task_status, :name => "Complete")
    @incomplete = FactoryGirl.create(:task_status, :name => "Incomplete")
    @in_progress = FactoryGirl.create(:task_status, :name => "In Progress")

    # Create 3 tasks
    @assign_rides = FactoryGirl.create(:task, :completed_by => @rachel, :task_status => @incomplete)
    @buy_wood = FactoryGirl.create(:task, :name => "Buy wood", :completed_by => @shannon, :task_status => @in_progress)
    @takeout_trash = FactoryGirl.create(:task, :name => "Take-out trash", :completed_by => @dylan, :task_status => @complete)    

    # Create 4 tools
    @hammer = FactoryGirl.create(:tool)
    @saw = FactoryGirl.create(:tool, :barcode => 1239043, :description => "SAW", :name => "Saw")
    @ladder = FactoryGirl.create(:tool, :barcode => 120120, :description => "LADDER", :name => "Ladder")
    @hard_hat = FactoryGirl.create(:tool, :barcode => 1280812, :description => "HARD HAT", :name => "Hard Hat")

    # Create 4 checkouts
    @hammer_checkout1 = FactoryGirl.create(:checkout, :checked_in_at => Date.new, :tool => @hammer)
    @hammer_checkout2 = FactoryGirl.create(:checkout, :tool => @hammer)
    @saw_checkout = FactoryGirl.create(:checkout, :tool => @saw)
    @hard_hat_checkout = FactoryGirl.create(:checkout, :tool => @hard_hat)
      
  end
  
  def remove_context
    # Destroy 4 organization categories
    @blitz.destroy
    @independent.destroy
    @frat.destroy
    @sorority.destroy

    # Destroy 3 organizations
    @theta.destroy
    @sdc.destroy
    @scc.destroy

    # Destroy 3 organization aliases
    @theta_alias.destroy
    @sdc_alias.destroy
    @scc_alias.destroy

    # Destroy 2 charge types
    @miss_meeting.destroy
    @trip_breaker.destroy

    # Destroy 4 participants
    @rachel.destroy
    @shannon.destroy
    @dylan.destroy
    @alexis.destroy

    # Destroy task status
    @complete.destroy
    @incomplete.destroy
    @in_progress.destroy

    # Destroy 3 tasks
    @assign_rides.destroy
    @buy_wood.destroy
    @takeout_trash.destroy    
    
    # Destroy 3 shift types
    @watch_shift.destroy
    @security_shift.destroy
    @ride_shift.destroy

    # Destroy 3 shifts
    @shift1.destroy
    @shift2.destroy
    @shift3.destroy

    # Destroy 4 shift_participants
    @sp1.destroy
    @sp2.destroy
    @sp3.destroy
    @sp4.destroy

    # Destroy 4 tools
    @hammer.destroy
    @saw.destroy
    @ladder.destroy
    @hard_hat.destroy

    # Destroy 4 checkouts
    @hammer_checkout1.destroy
    @hammer_checkout2.destroy
    @saw_checkout.destroy
    @hard_hat_checkout.destroy
    
    # Destroy 2 charges
    @meeting_fine.destroy
    @breaker_fine.destroy
    
    # Destroy 2 memberships
    @member_rachel.destroy
    @member_alexis.destroy
  end
end