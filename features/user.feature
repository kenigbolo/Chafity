Feature:
  Scenario: A user creates and account on chaifty
    Given I am at the 'index' page
    When I click on "Register"
    When I fill the form
    Then I should be redirected to the user dashboard