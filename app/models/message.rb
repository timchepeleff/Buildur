class Message < ActiveRecord::Base
  belongs_to :conversations
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id
end
