require "rails_helper"

RSpec.describe Preference, type: :model do
  let(:preference) { Preference.create(name: "bob") }

  it "was sucessfully created" do
    expect(preference).to be_a(Preference)
  end

  it "has a name" do
    expect(preference.name).to eq("bob")
  end
end
