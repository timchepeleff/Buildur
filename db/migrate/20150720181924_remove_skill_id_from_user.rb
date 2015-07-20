class RemoveSkillIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :skill_id
  end
end
