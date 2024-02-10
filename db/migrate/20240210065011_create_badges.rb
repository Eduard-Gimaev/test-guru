class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture, null: false
      t.string :rule, null: false
      t.string :rule_value, null: false
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
