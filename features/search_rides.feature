Feature: Search for bus ride

Scenario: Search for bus with no matches
  Given I am on the BusRide home page
  When I choose "One Way Trip"
  And I have searched for a bus with source "Iowa City, IA"
  And I initial departure date "Fri Mar 07 2014"
  And I initial destination "Des Moines, IA"
  And I initial return departure date "Mon Mar 10 2014"
  #And I initial number of passengers "1"
  When I click the "search" button
  #Then I should be on the BusRide home page
  Then I should see message "No routes found matching the search terms."

Scenario: Search bus for a one way trip
  Given I am on the BusRide home page
  And I have searched for a bus with source "New York, NY"
  And I initial destination "Washington, DC"
  And I initial departure date "Fri Apr 18 2014"
  And I initial return departure date "Sat Apr 19 2014"
  When I choose "One Way Trip"
  And I click the "search" button
  Then I should see the result table
  And I should see "New York, NY" in the "Departure" column
  And I should see "Washington, DC" in the "Arrival" column
  And I should not see the "#return-trip" button

Scenario: Search bus for a round trip with no matches
  Given I am on the BusRide home page
  When I choose "Round Trip"
  And I have searched for a bus with source "Boston, MA"
  And I initial destination "Newark, NJ"
  And I initial departure date "Fri Apr 18 2014"
  And I initial return departure date "Sat Apr 19 2014"
  When I click the "search" button
  #Then I should be on the BusRide home page
  Then I should see message "No routes found matching the search terms."

Scenario: Search bus for a round trip
  Given I am on the BusRide home page
  When I choose "Round Trip"
  And I have searched for a bus with source "New York, NY"
  And I initial destination "Washington, DC"
  And I initial departure date "Fri Apr 18 2014"
  And I initial return departure date "Sat Apr 19 2014"
  When I click the "search" button
  Then I should see the result table
  And I should see "New York, NY" in the "Departure" column
  And I should see "Washington, DC" in the "Arrival" column
  And I should see the "#return-trip" button
  When I click the "return-trip" button
  And I should see "Washington, DC" in the "Departure" column
  And I should see "New York, NY" in the "Arrival" column
  And I should see the "#go-trip" button
  When I click the "go-trip" button
  And I should see "New York, NY" in the "Departure" column

Scenario: Search bus for a round trip
  Given I am on the BusRide home page
  When I choose "Round Trip"
  And I have searched for a bus with source "New York, NY"
  And I initial destination "Washington, DC"
  And I initial departure date "Fri Apr 18 2014"
  And I initial return departure date "Sat Apr 19 2014"
  When I click the "search" button
  Then I should see the result table
  #And I should see "10" results
  #When I choose "5" from the "result-per-page" box
  #Then I should see "5" results

Scenario: Search bus from the navi bar on top
  Given I am on the BusRide home page
  When I choose "Round Trip"
  And I have searched for a bus with source "New York, NY"
  And I initial destination "Washington, DC"
  And I initial departure date "Fri Apr 18 2014"
  And I initial return departure date "Fri Apr 18 2014"
  When I click the "search" button
  Then I should see the result table
  And I should see "Apr 18,2014" in the "Departure" column
  And I should see the "#return-trip" button
  When I initial departure date "Tue Apr 19 2014"
  And I click the "search" button
  Then I should see the result table
  And I should see "Apr 19,2014" in the "Departure" column
  But I should not see the "#return-trip" button
  When I initial departure date "Fri Apr 18 2014"
  And I initial return departure date "Sat Apr 19 2014"
  When I click the "search" button
  Then I should see the result table
  And I should see "Apr 18,2014" in the "Departure" column
  And I should see the "#return-trip" button
  
