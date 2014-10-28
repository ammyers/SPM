Feature: As a participant
	So that my professors give me credit
	I want to have the option of selecting the alternative paper option
 
 @wip
Scenario: Select essay alternative
  Given I am on the All Studies page
  When I click "Select" within the Essay Alternative option
  Then I should be on the Available Studies page
  	But The Essay Alternative option is in My Studies