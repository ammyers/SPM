Feature: As a student that doesn't need experiment units to satisfy a class,
	I want to be able to sign up for an experiment,
	so that I can be a part of the process.

@wip
Scenario:
	Given I am on the login page
	And that I am not a student in a psychology class that requires research participation
	When I enter my information
	Then I should be able to log in