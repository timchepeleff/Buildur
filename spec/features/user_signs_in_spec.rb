require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do
  scenario 'specify valid credentials' do
    user = FactoryGirl.create(:user)

    login_as user

    expect(page).to have_content(user.name)
    expect(page).to have_content('Log Out')
  end
end
