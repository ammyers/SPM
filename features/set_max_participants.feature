Feature: As a researcher
	so that I don't get too many participants
	I want to be able to set a population cap for my experiment.

@wip
Scenario:
	Given I am on the Create New Study page
	When I type in a number into the max field
	And I click save
	Then the number is saved as the maximum number of participants allow to register for my study

@wip
Scenario:
	Given I am on the My Studies page
	When I click the edit button 
	And I change the maximum number of participants
	Then the amount of participants allow to register for my study changes