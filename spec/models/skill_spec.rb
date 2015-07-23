require "rails_helper"

RSpec.describe Skill, type: :model do
  let(:skill) { Skill.create(name: "bob") }

  it "was sucessfully created" do
    expect(skill).to be_a(Skill)
  end

  it "has a name" do
    expect(skill.name).to eq("bob")
  end
end
