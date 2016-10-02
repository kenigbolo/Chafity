Feature:
  Scenario: A user creates and account on chaifty
    Given I am at the 'index' page
    When I click on "Register"
    When I fill the form
    Then I should see my details
