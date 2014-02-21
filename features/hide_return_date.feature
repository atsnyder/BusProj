Feature: Hide the return date
  In Order to search for a trip
  As a traveler
  I want to see the text field for return date when choose a round trip
     
Scenario: hide return date
  Given I am on the BusRide home page
  And "Round Trip" is chosen
  Then I should see the text field for return date
  When I choose "One Way Trip"
  Then I should not see the text field for return date


Scenario: review return date
  Given I am on the BusRide home page
  When I choose "One Way Trip"
  Then I should not see the text field for return date
  When I choose "Round Trip"
  Then I should see the text field for return date
