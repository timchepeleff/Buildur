class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :example_url1
      t.string :example_url2
      t.string :techinterests
      t.string :location
      t.string :skill
      t.string :email
      t.string :website
      t.string :job
      t.text :about
    end
  end
end
