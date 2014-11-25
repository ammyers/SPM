Feature: As a researcher,
I want to be able to create a study,
so that I can create a study.

@wip
Scenario:
	Given I am on the All Studies page
	When I follow "Add new study"
	Then I am on the Create New Study page
	And I fill in "Title" with "Test 1"
	When I fill in "study_max_participants" with "20"
	When I fill in "Description" with "This is a test description"
	And I press "Save Changes"
	Then I am on the All Studies page