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
   fill_in 'user_password' , with: '1234567'
   fill_in 'user_password_confirmation', with: '1234567'
   click_on 'Sign up'
 end

 Then(/^I should see my details$/) do
   expect(page).to have_content('Toni Parn')
 end

