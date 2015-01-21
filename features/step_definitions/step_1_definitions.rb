Given (/^I am on the opinion page of the stage version of a USCP site$/) do
  visit('http://ux-preprod-app.democratandchronicle.com/opinion/')
end

And(/^I can see the PollDaddy module$/) do
  expect(page).to have_selector('.polldaddy-poll-suspender')
end

Then(/^I can see the word POLL in the left suspender$/) do
  expect(page).to have_content 'Poll'
end

When(/^I vote for the first poll choice$/) do
  first('.pmp-answer-option ').click
end

Then(/^I can see the results of the poll$/) do
  expect(page).to have_selector('.poll-answer-wrapper')
end

When(/^I click on the View Results link$/) do
  click_link("View Results")
end

When(/^I click on the See All Polls link$/) do
  click_link("See All Polls")
  sleep 4
end

Then(/^I am taken to the "(.*?)" page$/) do |textOnPage|
  expect(page).to have_content textOnPage
end

Given(/^I am on the Polls page$/) do
  visit('http://ux-preprod-app.democratandchronicle.com/polls/all/')
  expect(page).to have_content 'Polls'
end

When(/^I click on the title of the first poll$/) do
  first('.pmp-overlay-poll-link').click
end

Then(/^I am taken to the Your Say page for that poll$/) do
  expect(page).to have_selector('.polls-primary-wrapper')
  expect(page).to have_selector('.poll-question-wrapper')
end

When(/^I click on the first option$/) do
  first('.pmp-answer-option ').click
end

Then(/^I can see the poll results for that poll$/) do
  expect(page).to have_selector('.poll-answer-wrapper')
end

Given(/^I am on the Your Say page for a poll$/) do
  visit('http://ux-preprod-app.democratandchronicle.com/polls/all/')
  first('.pmp-overlay-poll-link').click
  expect(page).to have_selector('.polls-primary-wrapper')
  expect(page).to have_selector('.poll-question-wrapper')
end
