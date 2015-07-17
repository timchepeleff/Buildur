class CreateBlockeds < ActiveRecord::Migration
  def change
    create_table :blockeds do |t|

      t.timestamps null: false
    end
  end
end
