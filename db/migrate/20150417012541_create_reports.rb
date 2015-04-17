class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
