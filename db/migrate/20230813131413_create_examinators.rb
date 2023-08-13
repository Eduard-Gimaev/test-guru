class CreateExaminators < ActiveRecord::Migration[6.1]
  def change
    create_table :examinators do |t|
      t.string :name

      t.timestamps
    end
  end
end
