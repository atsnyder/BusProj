Given /^I am on the BusRide home page$/ do
  visit rides_path
 end

Given(/^I have searched for a bus with source "(.*?)"$/) do |from|
  fill_in 'from_search_box', :with => from
end

And(/^I initial departure date "(.*?)"$/) do |from_date|
  fill_in 'from_datepicker', :with => from_date
end

And(/^I initial destination "(.*?)"$/) do |to|
  fill_in 'to_search_box', :with => to
end

And(/^I initial return departure date "(.*?)"$/) do |to_date|
  fill_in 'to_datepicker', :with => to_date
end

And(/^I initial number of passengers "(.*?)"$/) do |passengers|
  fill_in 'passengers_box', :with => passengers
end

When(/^I click the search button$/) do
  click_button "search"
end

Then(/^I should be on the Search Results page$/) do
  visit rides_search_path
end

Then(/^I should see message "(.*?)"$/) do |msg|
  page.should have_content(msg)
end

When(/^"(.*?)" is chosen$/) do |radio|
  if(radio == "Round Trip")
    radio_id = "search_radio_RoundTrip"
  elsif(radio == "One Way Trip")
    radio_id = "search_radio_OneWay"
  end
  choose(radio_id)
end

When(/^I choose "(.*?)"$/) do |radio|
  if(radio == "Round Trip")
    radio_id = "search_radio_RoundTrip"
  elsif(radio == "One Way Trip")
    radio_id = "search_radio_OneWay"
  end
  choose(radio_id)
end

Then(/^I should( not)? see the text field for return date$/) do |should|
  visibility = should ? :false : :true
  page.should have_css('#to_datepicker', :visible => visibility)
end

Then(/^I should( not)? see the( back)? result table$/) do |should, back|
  exist = should ? :should_not : :should
  table = back ? '#rides_back_result' : '#rides_result'
  page.send(exist, have_css(table))
end

Then(/^I should see "(.*?)" in the "(.*?)" column of "(.*?)"$/) do |text, column, table|
  if(table == "result table")
    table_id = "#rides_result"
  elsif(table == "back result table")
    table_id = "#rides_back_result"
  end
 
  if(column == "Origin City")
    within table_id do
      page.all(text) do |t|
        t.should have_css('td.depart_city')
      end
    end
  elsif(column == "Destination City")
    within table_id do
      page.all(text) do |t|
        t.should have_css('td.arrive_city')
      end
    end
  end

end

