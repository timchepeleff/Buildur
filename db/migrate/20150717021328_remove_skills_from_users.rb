class RemoveSkillsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :skill
    add_reference :users, :skill, index: true
    remove_column :projects, :skills_needed
    add_reference :projects, :skill, index: true
  end
end
