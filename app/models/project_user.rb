class ProjectUser < ActiveRecord::Base
  validates_presence_of :project_id, null:false
  validates_presence_of :user_id, null:false
  belongs_to :project
  belongs_to :user
end
