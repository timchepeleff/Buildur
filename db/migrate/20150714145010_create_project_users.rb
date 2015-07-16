class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.integer :project_id, null:false
      t.integer :user_id, null:false

      t.timestamps null:false
    end
  end
end
