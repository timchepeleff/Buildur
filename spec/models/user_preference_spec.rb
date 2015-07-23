require "rails_helper"

RSpec.describe UserPreference, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:preference) { Preference.create(name: "bob") }
  let(:user_preference) { UserPreference.create(preference_id: preference.id, user_id: user.id) }

  it "was sucessfully created" do
    expect(user_preference).to be_a(UserPreference)
  end

  it "has a preference" do
    expect(user_preference.preference).to be_a(Preference)
  end

  it "has a user" do
    expect(user_preference.user).to be_a(User)
  end
end
