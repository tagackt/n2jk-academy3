class AddDetailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_id, :string
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :email_notification, :boolean
    add_column :users, :auth_hash, :text
  end
end
