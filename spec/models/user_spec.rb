require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:skill) { Skill.create(name: "bob") }
  let(:preference) { Skill.create(name: "bob") }
  let(:user_skill) { UserSkill.create(skill_id: skill.id, user_id: user.id) }
  let(:user_preference) { UserPreference.create(preference_id: preference.id, user_id: user.id) }
  let(:user1) { FactoryGirl.create(:user) }
  let(:friendship) { Friendship.create(user_id: user.id, friend_id: user1.id)}

  it "was sucessfully created" do
    expect(user).to be_a(User)
  end

  it "has a skills associated with it" do
    expect(user.skills).to_not be(nil)
  end


  it "destroys any associated skills/preferences when destroyed" do
    user
    skill
    preference
    user_skill
    user_preference

    expect(User.first).to be_a(User)
    user.destroy
    expect(UserSkill.all).to eq([])
    expect(UserPreference.all).to eq([])
  end

  it "destroys any associated skills/friendships/preferences when destroyed" do
    user
    user1
    friendship

    expect(User.first).to be_a(User)
    expect(Friendship.all.first).to be_a(Friendship)
    user.destroy
    expect(Friendship.all).to eq([])
  end

  it "destroys all associations when destroyed" do
    user
    skill
    preference
    user_skill
    user_preference
    user1
    friendship

    expect(User.first).to be_a(User)
    expect(Friendship.all.first).to be_a(Friendship)
    user.destroy
    expect(UserSkill.all).to eq([])
    expect(UserPreference.all).to eq([])
  end

  it "displays correct search results based off of preferences and skills" do
    user
    skill
    preference
    user.user_skills.build(skill_id: skill.id)
    UserPreference.create(user_id: user.id, preference_id: preference.id)
    user1.user_skills.build(skill_id: skill.id)

    a = User.search(nil, user)
  end
end
