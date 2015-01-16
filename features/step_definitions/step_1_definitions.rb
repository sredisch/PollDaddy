And (/^I am on the opinion page of the stage version of a USCP site$/) do
  visit('http://ux-preprod-app.democratandchronicle.com/opinion/')
  sleep 3
end

Given(/^my browser history is cleared$/) do
  browser = Capybara.current_session.driver.browser
  Capybara.default_wait_time = 12
  browser.manage.delete_all_cookies
  sleep 10
end

Then(/^I can see the PollDaddy module$/) do
  #expect(page).to have_xpath("//div[@class='polldaddy-poll-suspender card-suspender']")
  find("[class='polldaddy-poll-suspender card-suspender']")
end

Then(/^I can see the word 'POLL' in the left suspender$/) do
  expect(page).to have_content 'Poll'
end

When(/^I vote for the first poll choice$/) do
  find(:xpath, '//div[@class=\'pmp-answer-options\']/div[1]').click
end

Then(/^I can see the results of the poll$/) do
 find("[class='poll-answer-wrapper pmp-active']")
end

When(/^I click on the 'View Results' link$/) do
  click_link("View Results")
end

When(/^I click on the 'See All Polls' link$/) do
  click_link("See All Polls")
end

Then(/^I am taken to the 'Polls' page$/) do
  expect(page).to have_content 'Polls'
end

And(/^I am on the 'Polls' page$/) do
  visit('http://ux-preprod-app.democratandchronicle.com/polls/all/')
  sleep 3
  expect(page).to have_content 'Polls'
end

When(/^I click on the title of the first poll$/) do
  find(:xpath, '//div[@class=\'pmp-overlay-content\']/div[1]/a').click
end

Then(/^I am taken to the 'Your Say' page for that poll$/) do
  find("[class='polls-primary-wrapper']")
  find("[class='poll-question-wrapper pmp-active']")
end

When(/^I click on the first option$/) do
  find(:xpath, '//div[@class=\'pmp-answer-options\']/div[1]').click
end

Then(/^I can see the poll results for that poll$/) do
  find("[class='poll-answer-wrapper pmp-active']")
end

And(/^I am on the 'Your Say' page for a poll$/) do
  visit('http://ux-preprod-app.democratandchronicle.com/polls/all/')
  sleep 3
  find(:xpath, '//div[@class=\'pmp-overlay-content\']/div[1]/a').click

  find("[class='polls-primary-wrapper']")
  find("[class='poll-question-wrapper pmp-active']")
end
