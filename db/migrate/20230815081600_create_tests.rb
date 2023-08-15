class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null:false
      t.integer :level
      t.references :categories, foreign_key: true, null: false

      t.timestamps
    end
  end
end
