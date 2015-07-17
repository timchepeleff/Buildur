class AddPreferenceToUser < ActiveRecord::Migration
  def change
    add_reference :users, :preference, index: true
    add_reference :projects, :preference, index: true
  end
end
