require 'rails_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to Log Out
  So that my identity is forgotten about on the machine I'm using
} do
  # Acceptance Criteria
  # * If I'm signed in, i have an option to sign out
  # * When I opt to sign out, I get a confirmation that my identity has been
  #   forgotten on the machine I'm using

  scenario 'authenticated user signs out' do
    user = FactoryGirl.create(:user)

    login_as user

    expect(page).to have_content(user.name)

    click_link 'Log Out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'unauthenticated user attempts to Log Out' do
    visit '/'
    expect(page).to_not have_content('Log Out')
  end
end
