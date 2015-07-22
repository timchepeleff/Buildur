require "rails_helper"

RSpec.describe Preference, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:user1) { FactoryGirl.create(:user) }

  it "was sucessfully created" do
    expect(friendship).to be_a(Friendship)
  end

  it "has a user" do
    expect(friendship.user).to be_a(User)
  end

  it "a user has friends" do
    expect(user.friendships).to_not be(nil)
  end
end

