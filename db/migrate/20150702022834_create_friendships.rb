class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps null: false
      t.index [:user_id, :friend_id], unique: true
    end
  end
end
