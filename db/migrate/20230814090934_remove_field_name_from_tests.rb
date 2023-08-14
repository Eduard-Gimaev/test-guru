class RemoveFieldNameFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :categories_id, :string
  end
end
