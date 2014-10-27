Scenario: Request login page
Given I request web page from localhost:3000/researcher/login
I should see login.html

Scenario: Request all_studies page
Given I request web page from localhost:3000/researcher/all_studies
I should see login.html

Scenario: Request create_study page
Given I request web page from localhost:3000/researcher/create_study
I should see login.html

Scenario: Request profile page
Given I request web page from localhost:3000/researcher/profile
I should see login.html

Scenario: Request researcher page
Given I request web page from localhost:3000/researcher/researcher
I should see login.html

Scenario: Request study_details page
Given I request web page from localhost:3000/researcher/study_details
I should see login.html