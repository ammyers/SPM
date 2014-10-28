Scenario: Request login page
Given I request web page from localhost:3000/admin/login
I should see login.html

Scenario: Request all_studies page
Given I request web page from localhost:3000/admin/all_studies
I should see all_studies.html

Scenario: Request profile page
Given I request web page from localhost:3000/admin/profile
I should see profile.html

Scenario: Request create_study page
Given I request web page from localhost:3000/admin/admin
I should see admin.html

Scenario: Request study_details page
Given I request web page from localhost:3000/admin/study_details
I should see study_details.html