class SetDefaultValueForTestsLevel < ActiveRecord::Migration[6.1]
  def change 
    change_column_default :tests, :level, true
  end
end
