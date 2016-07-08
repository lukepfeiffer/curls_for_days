Given /^I am signed in as a user$/ do
  Fabricate(:user)
  visit new_user_path
  fill_in 'session_email', with: 'email@example.com'
  fill_in 'session_password', with: 'password'
  click_button 'Sign In'
end

When /^I follow "(.+)"$/ do |link_name|
  click_link link_name
end

And /^I visit "(.+)"$/ do |path|
  visit path
end

Given "I am on the home page" do
  visit root_path
end

And /^I am on the "(.+)" page$/ do |path|
  visit path
end

Given /^I have a created user$/ do
  FactoryGirl.create(:user)
end

When /^I fill in "(.+)" with "(.+)"$/ do |field, value|
  fill_in field, with: value
end

When /^I press "(.+)"$/ do |button_name|
  click_button button_name
end

Then /^I should be on the "(.+)" page$/ do |path|
  expect(page.current_path).to eq(path)
end

Then /^I should see "(.+)"$/ do |content|
  expect(page).to have_content(content)
end

Then /^I should not see "(.+)"$/ do |content|
  expect(page).not_to have_content(content)
end
