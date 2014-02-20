Given /^I am on the BusRide home page$/ do
  visit rides_path
 end

Given(/^I have searched for a bus with source "(.*?)" and initial departure date "(.*?)" and destination "(.*?)" and return departure date "(.*?)" and number of passengers "(.*?)" and I click the search button$/) do |from, from_date, to, to_date, passengers|
  fill_in 'to', :with => to
  fill_in 'from', :with => from
  fill_in 'to_date', :with => to_date
  fill_in 'from_date', :with => from_date
  fill_in 'passengers', :with => passengers
  click_button "Search"
end

Then(/^I should be on the Search Results page$/) do
  visit rides_search
end

Then(/^I should see "(.*?)"$/) do |msg|
  pending # express the regexp above with the code you wish you had
end

