Feature: Search for bus ride
     
Scenario: Search for bus with no matches
     
 Given I am on the BusRide home page
 And I have searched for a bus with source "Iowa City" and initial departure date "Thu Apr 17 2014" and destination "Des Moines" and return departure date "Fri Apr 18 2014" and number of passengers "1" and I click the search button
 Then I should be on the Search Results page
 And I should see "This is results page"


