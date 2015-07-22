require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:uid) { |n| 10000 + n }
    provider "github"
    sequence(:email) { |n| "buildur#{n}@gmail.com" }
    sequence(:name) { |n| "Buildur Rudliub #{n}" }
    avatar_url "http://i.imgur.com/vnEJUtm.gif"
    token { SecureRandom.hex }
    password Devise.friendly_token[0,20]
  end

  factory :skill do
    sequence(:name) { |n| "tim#{n}"}
  end
end
