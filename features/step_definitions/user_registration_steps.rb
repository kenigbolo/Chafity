# require 'spec/rails_helper'

Given(/^I am at the 'index' page$/) do
  visit root_path
  expect(page).to have_content("Connecting for charity")
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_on arg1
  expect(page).to have_content('Register')
end

When(/^I fill the form$/) do
  fill_in 'Email', with: 'toniparn1@gmail.com'
  fill_in 'First name', with: 'Toni'
  fill_in 'Last name', with: 'Parn'
  # fill_in 'Location', with: 'Tallinn'
  # fill_in 'Headline', with: 'Business guy'
  # fill_in 'Description', with: 'I like doing business'
  fill_in 'user_password' , with: '1234567'
  fill_in 'user_password_confirmation', with: '1234567'
  click_on 'Sign up'
end

Then(/^I should see my details$/) do
  expect(page).to have_content('Dashboard Logout Toni Parn')
end

# When(/^I click on 'Login with linkedin'$/) do
#   pending # Routing error
#   # click_on 'linkedin_login'
#    # expect(page).to have_content('Chafity would like to access some of your LinkedIn info:')
# end
#
# Then(/^I should be redirected to linked$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When(/^I enter my 'email' and 'password'$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then(/^I should be back on chafity dashboard$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
