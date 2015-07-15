class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :avatar_url, :string
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :repos_url, :string
    add_column :users, :token, :string
    add_column :users, :github_id, :string
    add_column :users, :example_url1, :string
    add_column :users, :example_url1_img, :string
    add_column :users, :example_url2, :string
    add_column :users, :example_url2_img, :string
    add_column :users, :techinterests, :string
    add_column :users, :location, :string
    add_column :users, :skill, :string
    add_column :users, :website, :string
    add_column :users, :job, :string
    add_column :users, :about, :string
    change_column_null :users, :email, true

    remove_index :users, name: :index_users_on_email
    add_index "users", ["email"], name: "index_users_on_email", using: :btree
    add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree
  end
end
