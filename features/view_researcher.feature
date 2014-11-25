Feature: As a participant,
	I want to be able to view the names of the researchers conducting each study,
	so that I can choose to not sign up for studies my friends are conducting.

@wip
Scenario:
	Given I am on the All Studies page
	When I follow on "SELECT STUDY: Test Study" 
	Then the page should display the name/s of the researcher/s