Given /^I am on the BusRide home page$/ do
  visit rides_path
 end

Given(/^I have searched for a bus with source "(.*?)" and initial departure date "(.*?)" and destination "(.*?)" and return departure date "(.*?)" and number of passengers "(.*?)" and I click the search button$/) do |from, from_date, to, to_date, passengers|
  fill_in 'To', :with => to
  fill_in 'From', :with => from
  fill_in 'To_Date', :with => to_date
  fill_in 'From_Date', :with => from_date
  fill_in '# of passengers', :with => passengers
  click_button "Search"
end

Then(/^I should be on the Search Results page$/) do
  visit rides_search_path
end

Then(/^I should see "(.*?)"$/) do |msg|
  page.should have_content(msg)
end

