Feature: As an admin,
	I want to be able to see a list of my students who are electing to write essays,
	so that I can know how many to expect.

# currently no Paper Options column (or any column) on All Users page
@wip
Scenario:
	Given I am on the home page
	When I follow "Log in as Admin"
	Then I should be on the All Users page
	Then I should see the Paper Option column

# run 'rake db:seed RAILS_ENV=test' first; for this test data is needed in the test db for it to work. We should note as much on piazza so Joel knows.
Scenario:
	Given I am on the Home Page
	When I follow "Log in as Participant"
	Then I should be on the All Studies page
	When I follow "MY ACCOUNT"
	Then I should be on the My Account page
	When I follow "Edit"
	Then I should be on the Edit User page
	When I select "Yes" from "user[paper_option]"
	And I press "Update User Info"
	Then I should be on the My Account page
	And I should see "Paper Option: Yes"