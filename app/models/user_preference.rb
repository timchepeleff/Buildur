class UserPreference < ActiveRecord::Base
  validates_presence_of :preference_id, null:false
  validates_presence_of :user_id, null:false
  belongs_to :preference
  belongs_to :user
end
