class AddIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, default: "", null: false
    add_index :users, :email, unique: true
  end
end
