class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :skills_needed
      t.belongs_to :user null: false

      t.timestamps null: false
    end
  end
end
