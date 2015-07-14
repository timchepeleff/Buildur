class CreateProjects < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :skills_needed
      t.integer :n_of_users

      t.timestamps null: false
    end
  end
end
