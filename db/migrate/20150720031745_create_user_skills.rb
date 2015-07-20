class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.integer :user_id, null: false
      t.integer :skill_id, null: false

      t.timestamps null: false
    end
  end
end
