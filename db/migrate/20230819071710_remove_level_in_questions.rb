class RemoveLevelInQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :level, :integer
  end
end
