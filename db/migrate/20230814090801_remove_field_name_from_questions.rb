class RemoveFieldNameFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :tests_id
  end
end
