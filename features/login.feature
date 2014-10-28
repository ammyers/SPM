# all scenarios with logging in
Feature: As a user
	So that I can use the program
	I want to be able to log in


Scenario: Log In
	Given I am on the login page
	When I enter my username and password
	Then I should be logged in
	And I should go to All Studies page