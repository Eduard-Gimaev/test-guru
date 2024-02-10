class AddSuccededToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :succeded, :boolean, default: false 
  end
end
