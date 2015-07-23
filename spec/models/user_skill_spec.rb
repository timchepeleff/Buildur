require "rails_helper"

RSpec.describe UserSkill, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:skill) { Skill.create(name: "bob") }
  let(:user_skill) { UserSkill.create(skill_id: skill.id, user_id: user.id) }

  it "was sucessfully created" do
    expect(user_skill).to be_a(UserSkill)
  end

  it "has a preference" do
    expect(user_skill.skill).to be_a(Skill)
  end

  it "has a user" do
    expect(user_skill.user).to be_a(User)
  end
end
