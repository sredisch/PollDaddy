@polldaddy
Feature: I would like to use the PollDaddy feature on a USCP site

@poll
Scenario: I attempt to find the PollDaddy module
Given my browser history is cleared
  And I am on the opinion page of the stage version of a USCP site
Then I can see the PollDaddy module
  And I can see the word 'POLL' in the left suspender

@viewresults
Scenario: I can view the results of the poll without voting
Given my browser history is cleared
  And I am on the opinion page of the stage version of a USCP site
When I click on the 'View Results' link
Then I can see the results of the poll

@vote
Scenario: I can vote in the featured PollDaddy poll
Given my browser history is cleared
  And I am on the opinion page of the stage version of a USCP site
When I vote for the first poll choice
Then I can see the results of the poll

@seeallpolls @recentpollspage
Scenario: I should be able to see all recent PollDaddy polls
Given my browser history is cleared
  And I am on the opinion page of the stage version of a USCP site
When I click on the 'See All Polls' link
Then I am taken to the 'Polls' page

@polls @recentpollspage
Scenario: I should be able to vote in the first poll
Given my browser history is cleared
And I am on the 'Polls' page
When I click on the title of the first poll
Then I am taken to the 'Your Say' page for that poll
When I click on the first option
Then I can see the poll results for that poll
When I click on the 'See All Polls' link
Then I am taken to the 'Polls' page

@yoursay @viewresults
Scenario: I should be able view results of a recent poll without voting
Given my browser history is cleared
And I am on the 'Your Say' page for a poll
When I click on the 'View Results' link
Then I can see the results of the poll
