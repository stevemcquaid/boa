Feature: Manage charges

	As an admin
	I want to be able to manage charge information
	So I can make money

	Background:
		Given an initial charge

	Scenario: View charges
		When I go to the charges page
		Then I should see "Organization"
		And I should see "Charge Type"
		And I should see "Amount"
		And I should see "Description"
		And I should see "Charged At"