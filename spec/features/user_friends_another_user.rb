require 'rails_helper'

feature 'user creates profile', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do

  scenario 'user fills out profile correctly', js: true do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)

    login_as user

    create_profile

    visit user1
  end
end
