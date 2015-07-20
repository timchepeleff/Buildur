class RemovePreferenceIdUser < ActiveRecord::Migration
  def change
    remove_column :users, :preference_id
  end
end
