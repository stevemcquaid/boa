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

    # Create 2 organizations
    @theta = FactoryGirl.create(:organization, :name => "Kappa Alpha Theta", :organization_category => @sorority)
    @sdc = FactoryGirl.create(:organization, :name => "Student Dormitory Council", :organization_category => @independent)

    # Create 2 organization aliases
    @theta_alias = FactoryGirl.create(:organization_alias, :name => "Theta", :organization => @theta)
    @sdc_alias = FactoryGirl.create(:organization_alias, :name => "SDC", :organization => @sdc)

    # Create three charge types
    @miss_meeting = FactoryGirl.create(:charge_type, :default_amount => 100.00, :description => "Missed a meeting", :name => "Meeting", :requires_booth_chair_approval => false)
    @trip_breaker = FactoryGirl.create(:charge_type, :default_amount => 200.00, :description => "Tripped a breaker", :name => "Breaker", :requires_booth_chair_approval => true)
  
  end
  
  def remove_context
    # Destroy 4 organization categories
    @blitz.destroy
    @independent.destroy
    @frat.destroy
    @sorority.destroy

    # Destroy 2 organizations
    @theta.destroy
    @sdc.destroy

    # Destroy 2 organization aliases
    @theta_alias.destroy
    @sdc_alias.destroy

    # Destroy three charge types
    @miss_meeting.destroy
    @trip_breaker.destroy
  end
end