class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :user_id, null:false
      t.integer :preference_id, null:false

      t.timestamps null: false
    end
  end
end
