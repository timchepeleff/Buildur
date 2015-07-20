class UserSkill < ActiveRecord::Base
  validates :skill_id, presence: true, null: false
  validates :user_id, presence: true, null: false
  belongs_to :skill
  belongs_to :user
end
