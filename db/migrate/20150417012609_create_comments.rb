class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.integer :resource_id
      t.string :resource_type

      t.timestamps null: false
    end
  end
end
