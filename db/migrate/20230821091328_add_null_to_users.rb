class AddNullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user, :string, null: false
  end
end
