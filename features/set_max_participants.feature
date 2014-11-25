#cucumber - tests controllers
Feature: As a researcher
	So that I do not get too many participants
	I want to be able to set a population cap for my experiment.

#create study page currently has an error
@wip
Scenario:
	Given I am on the Create New Study page
	And I fill in "Title" with "Test 1"
	When I fill in "study_max_participants" with "20"
	And I press "save_changes"
	Then I am on the All Studies page
	When I follow "SELECT STUDY: Test 1"
	Then I should see 20 in max_participants field

@wip
Scenario:
	Given I am on the My Studies page
	When I click the edit link 
	And I change the maximum number of participants
	Then the amount of participants allow to register for my study changes