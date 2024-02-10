class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :pucture, null: false
      t.string :rule, null: false
      t.string :rule_value, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
