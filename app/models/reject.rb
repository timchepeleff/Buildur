class Reject < ActiveRecord::Base
  belongs_to :user
  has_many :users
  validates :user_id, uniquness: true, scope: :reject_id, message: "already rejected"
end
