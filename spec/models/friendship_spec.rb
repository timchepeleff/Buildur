require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:user1) { FactoryGirl.create(:user) }
  let(:friendship) { Friendship.create(user_id: user.id, friend_id: user1.id)}

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
