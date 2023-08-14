class RemoveFieldNameFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :result
  end
end
