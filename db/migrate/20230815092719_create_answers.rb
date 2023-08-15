class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.string :correct, default: true
      t.references :questions, foreign_key: true, null: false

      t.timestamps
    end
  end
end
