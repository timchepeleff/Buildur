class UserPreference < ActiveRecord::Base
  validates :preference_id, presence: true, null: false
  validates :user_id, presence: true, null: false
  belongs_to :preference
  belongs_to :user
end
