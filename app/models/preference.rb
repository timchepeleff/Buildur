class Preference < ActiveRecord::Base
  has_many :users, through: :user_preferences
  has_many :user_preferences
  has_many :projects
end
