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

    expect(page).to have_content('Log Out')
  end
end
