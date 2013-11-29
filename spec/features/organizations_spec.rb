require 'spec_helper'

describe "Organizations" do
  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get organizations_path
      response.status.should be(200)
describe "the signin process", :type => :feature do
  before :each do
    User.make(:email => 'smcquaid@andrew.cmu.edu', :password => 'testtest')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Login', :with => 'smcquaid@andrew.cmu.edu'
      fill_in 'Password', :with => 'testtest'
    end
    click_link 'Sign in'
    expect(page).to have_content 'Success'
  end
end
