class SetDefaultValueForAnswersResult < ActiveRecord::Migration[6.1]
  def change 
    change_column_default :answers, :result, true
  end
end
