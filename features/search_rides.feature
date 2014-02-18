    Feature: User can find bus to ride by searching for it
     
      As a bus rider
      so that I can find a bus to ride
      I want find a bus ride by searching by criteria 
     
    Scenario: Try to find nonexistent bus ride (sad path)
     
      Given I am on the BusRide home page
      Then I should see "Search"
      When I fill in "Search Terms" with "No bus that fits criteria"
      And I press "Search"
      Then I should be on the BusRide home page
      And I should see "No matching bus rides were found."


