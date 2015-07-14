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
    change_column_null :users, :email, true

    remove_index :users, name: :index_users_on_email
    add_index "users", ["email"], name: "index_users_on_email", using: :btree
  end
end
