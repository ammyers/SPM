Feature: As a study participant,
	I want to be able to easily view available studies,
	so that I can sign up for studies.

Scenario:
	Given I am the Home page
	When I follow "Log in as Participant"
	Then I should be on the All Studies page
	Then I should see "studies"