class SkillUser < ActiveRecord::Base
  validates_presence_of :skill_id, null:false
  validates_presence_of :user_id, null:false
  belongs_to :skill
  belongs_to :user
end
