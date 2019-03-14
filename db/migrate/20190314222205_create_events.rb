class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.integer :limit
      t.integer :user_id
      t.timestamp
    end
  end
end
