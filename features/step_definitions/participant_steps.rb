<<<<<<< HEAD
# Scenario: Request login page
# Given I request web page from localhost:3000/participant/login
# I should see login.html
=======
Scenario: Request login page
Given I request web page from localhost:3000/participant/login
I should see login.html

Scenario: Request my_studies page
Given I request web page from localhost:3000/participant/my_studies
I should see my_studies.html

Scenario: Request all_studies page
Given I request web page from localhost:3000/participant/all_studies
I should see all_studies.html

Scenario: Request profile page
Given I request web page from localhost:3000/participant/profile
I should see profile.html

Scenario: Request create_study page
Given I request web page from localhost:3000/participant/create_study
I should see create_study.html

Scenario: Request study_details page
Given I request web page from localhost:3000/participant/study_details
I should see study_details.html
>>>>>>> 6e73b7d685b9390bd789337c5fd4ea17e7c63cb3
