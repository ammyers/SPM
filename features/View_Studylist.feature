Feature: As a participant
	So that I know which studies I have signed up for, and which I have completed. 
	I want to have the ability to view a studylist


Scenario: View Studylist
	Given I am on the Home Page
	When I follow "Log in as Participant"
	Then I should be on the All Studies page
	When I follow "MY ACCOUNT"
	Then I should be on the My Account page
  	And I should see "Studylist"