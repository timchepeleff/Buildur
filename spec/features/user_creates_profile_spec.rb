require 'rails_helper'

feature 'user creates profile', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do

  scenario 'user fills out profile correctly', js: true do
    user = FactoryGirl.create(:user)

    login_as user

    select_from_chosen("Ruby", from: "user_skills")
    select_from_chosen("Ruby on Rails", from: "user_skills")

    select_from_chosen("Ruby", from: "user_preferences")
    select_from_chosen("Ruby on Rails", from: "user_preferences")

    fill_in 'Technical Interest', with: 'Vim'
    fill_in 'Job Title', with: 'Looking for Work'
    fill_in 'Location', with: 'Boston, MA'

    fill_in 'About', with: "Some of the most important lessons I’ve learned about programming are by messing things up, big time. The biggest challenges I’ve faced have always boiled down to problem solving. Understanding what the challenge’s needs are and breaking them down into smaller, more digestible bits, helps me to achieve one of my favorite approaches - MPA (Minimum Path to Awesome). I’ve learned to slow down and, before even typing anything, I make it a point to just think. I like to brainstorm with another programmer before starting something big in hopes to catch any logical errors I might have made."

    expect(page).to have_content("Ruby")
    expect(page).to have_content("Ruby on Rails")
    click_button "Update Profile"
    expect(page).to have_content("Vim")
    expect(page).to have_content("Looking for Work")
    expect(page).to have_content("Boston, MA")
    expect(page).to have_content("Some of the most important lessons I’ve learned about programming are by messing things up, big time. The biggest challenges I’ve faced have always boiled down to problem solving. Understanding what the challenge’s needs are and breaking them down into smaller, more digestible bits, helps me to achieve one of my favorite approaches - MPA (Minimum Path to Awesome). I’ve learned to slow down and, before even typing anything, I make it a point to just think. I like to brainstorm with another programmer before starting something big in hopes to catch any logical errors I might have made.")
    expect(page).to have_content('Log Out')
  end
end
