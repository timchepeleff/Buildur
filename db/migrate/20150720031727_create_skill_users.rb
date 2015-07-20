class CreateSkillUsers < ActiveRecord::Migration
  def change
    create_table :skill_users do |t|

      t.timestamps null: false
    end
  end
end
