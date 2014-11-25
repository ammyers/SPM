Feature: As a study participant,
	I want to be able to easily view my studies,
	so that I can review my commitments.

Scenario:
	Given I am on the Home Page
	When I follow "Log in as Participant"
	Then I should be on the All Studies page
	When I follow "MY STUDIES"
	Then I should be on the My Studies page
	Then I should see "My Studies"
