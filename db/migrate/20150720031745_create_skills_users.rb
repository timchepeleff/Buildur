class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users do |t|

      t.timestamps null: false
    end
  end
end
