Feature: Manage charges

	As an admin
	I want to be able to manage charge information
	So I can make money

	Scenario: Create a new charge
		Given I am on the charges page
		I should see "Organization"
		I should see "Charge Type"
		I should see "Amount"
		I should see "Description"
		I should see "Charged At"