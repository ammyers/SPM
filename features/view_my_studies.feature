Feature: As a study participant,
	I want to be able to easily view my studies,
	so that I can review my commitments.

Scenario:
	Given I am signed in
	And I my role is "participant"
	When I follow "View My Studies"
	Then I should be on the My Studies page
	Then I should see "studies"