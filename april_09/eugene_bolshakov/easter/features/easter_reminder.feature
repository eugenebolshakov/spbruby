Feature: Subscribe to and receive Easter reminder
  Not to forget about it
  As an absent-minded person
  I should be able to subscribe to and receive Easter reminder

  Scenario: Subscription
    When I go to "the homepage"
    And I follow "Subscribe to the reminder"
    And I subscribe with "eugene.bolshakov@gmail.com"
    Then I should see "You've been subscribed!"

  Scenario: Reminder sending out
    Given there are the following subscribers:
      | email                      |
      | eugene.bolshakov@gmail.com |
      | somebody@somewhere.com     |
      | somebodyelse@gmail.com     |
    When reminders are sent out
    Then 3 people should receive emails
