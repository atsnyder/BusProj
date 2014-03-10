Feature: Search for bus ride

Scenario: Search for bus with no matches
  Given I am on the BusRide home page
  When I choose "One Way Trip"
  And I have searched for a bus with source "Iowa City, IA"
  And I initial departure date "Thu Apr 17 2014"
  And I initial destination "Des Moines, IA"
  And I initial return departure date "Fri Apr 18 2014"
  And I initial number of passengers "1"
  When I click the search button
  #Then I should be on the BusRide home page
  Then I should see message "No routes found match the search terms."

Scenario: Search bus for a one way trip
  Given I am on the BusRide home page
  When I choose "One Way Trip"
  And I have searched for a bus with source "Boston, MA"
  And I initial destination "Newark, NJ"
  When I click the search button
  #Then I should be on the BusRide result page
  Then I should see the result table
  And I should see "Boston, MA" in the "Origin City" column of "result table"
  And I should see "Newark, NJ" in the "Destination City" column of "result table"
  And I should not see the back result table

Scenario: Search bus for a round trip with no matches
  Given I am on the BusRide home page
  When I choose "Round Trip"
  And I have searched for a bus with source "Boston, MA"
  And I initial destination "Newark, NJ"
  When I click the search button
  #Then I should be on the BusRide home page
  Then I should see message "No routes found match the search terms."

Scenario: Search bus for a round trip
  Given I am on the BusRide home page
  When I choose "Round Trip"
  And I have searched for a bus with source "New York, NY"
  And I initial destination "Washington, DC"
  When I click the search button
  #Then I should be on the BusRide home page
  Then I should see the result table
  And I should see "New York, NY" in the "Origin City" column of "result table"
  And I should see "Washington, DC" in the "Destination City" column of "result table"
  And I should see the back result table
  And I should see "Washington, DC" in the "Origin City" column of "back result table"
  And I should see "New York, NY" in the "Destination City" column of "back result table"
