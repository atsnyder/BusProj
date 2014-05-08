When(/^I click the "(.*?)" button$/) do |btn|
  click_button btn
end

And(/^I should( not)? see the "(.*?)" button$/) do |should, btn|
  exist = should ? :should_not : :should
  page.send(exist, have_css(btn))
end

Given /^I am on the BusRide home page$/ do
  visit rides_path
 end

Given(/^I have searched for a bus with source "(.*?)"$/) do |from|
  fill_in 'search_from_city', :with => from
end

And(/^I initial departure date "(.*?)"$/) do |from_date|
  fill_in 'from_datepicker', :with => from_date
<<<<<<< HEAD
  puts find_field("from_datepicker").value.nil?
  #msg = "No element found with the content of '#{from_date}'"
  #page.execute_script("$('whatever_you_want').click()");
  find("#search_to_city").click
  puts page.has_css?('div.pika-single')
  puts page.has_css?('div.radientBG')
  #within('div.pika-single') do
  #  find('#day5').click
  #end
  #puts find_field("from_datepicker").value.nil?
  #page.execute_script %Q{ $('#auction_event_date').trigger("focus") } # activate datetime picker
  #page.execute_script %Q{ $('a.ui-datepicker-next').trigger("click") } # move one month forward
  #page.execute_script %Q{ $("a.ui-state-default:contains('15')").trigger("click") } # click on day 15

end

And(/^I initial destination "(.*?)"$/) do |to|
  fill_in 'search_to_city', :with => to
end

And(/^I initial return departure date "(.*?)"$/) do |to_date|
  fill_in 'to_datepicker', :with => to_date
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
  table = '#myTable'#back ? '#rides_back_result' : '#rides_result'
  #puts within_frame("go_table")
  page.send(exist, have_css(table))
end

Then(/^I should see "(.*?)" in the "(.*?)" column$/) do |text, column|
  table_id = '#myTable'
 
  if(column == "Departure")
    within table_id do
      page.all('td.depart_city') do |t|
        t.should have_content(text)
      end
    end
  elsif(column == "Arrival")
    within table_id do
      page.all('td.arrive_city') do |t|
        t.should have_content(text)
      end
    end
  end

end

Then(/^I should see two result table$/) do
  pending
end

Then(/^I should see "(.*?)" results$/) do |rpp|
  assert page.body.scan('$').length == rpp.to_i, "#{page.body.scan('$').length} results per page"
end

When(/^I choose "(.*?)" from the "(.*?)" box$/) do |choice, box|
  select(choice, :from => box)
end

