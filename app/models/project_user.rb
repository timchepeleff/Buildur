class ProjectUser < ActiveRecord::Base
  validates :project_id, presence: true, null: false
  validates :user_id, presence: true, null: false
  belongs_to :project
  belongs_to :user
end
