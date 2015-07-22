class Reject < ActiveRecord::Base
  belongs_to :user
  has_many :users
  validates_uniqueness_of :user_id, scope: :reject_id, message: "already rejected"
  validates :user_id, presence: true
  validates :reject_id, presence: true
end
