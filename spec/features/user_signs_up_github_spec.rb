require 'rails_helper'

feature 'user registers with github', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'provide valid registration information' do
    login_as user

    expect(page).to have_content(user.name)
    expect(page).to have_content('Log Out')
  end
end
