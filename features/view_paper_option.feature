Feature: As an admin,
	I want to be able to see a list of my students who are electing to write essays,
	so that I can know how many to expect.

@wip
Scenario:
	Given I am on the Admin page
	When I sort by Paper Option
	Then I should see all the students that selected the paper option