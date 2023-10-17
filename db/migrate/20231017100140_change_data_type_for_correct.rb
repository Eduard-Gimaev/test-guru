class ChangeDataTypeForCorrect < ActiveRecord::Migration[6.1]
  def self.up
    change_table :answers do |t|
      t.change :correct, :boolean
    end
  end
  def self.down
    change_table :answers do |t|
      t.change :correct, :string
    end
  end
end
