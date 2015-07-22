require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do
  scenario 'specify valid credentials' do
    user = FactoryGirl.create(:user)

    login_as user

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Log Out')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Log Out')
  end
end
