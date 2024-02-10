class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :subject, null: false
      t.text :feedback, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
