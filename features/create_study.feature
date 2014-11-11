Feature: As a researcher,
I want to be able to create a study,
so that I can create a study.


Scenario:
	Given I am on the Researcher page
		And I am on the All Studies page
	When I click Add New Study link
	When I follow "Add New Study"
	Then I am on the Create New Study page
	And I fill in "Title" with "Test 1"
	When I fill in "study_max_participants" with "20"
	And I press "Save Changes"
	Then I am on the All Studies page
	When I follow "More about Test 1"
	Then I should see 20 in max_participants field