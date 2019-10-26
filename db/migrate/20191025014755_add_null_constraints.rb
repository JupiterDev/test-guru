class AddNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 1)
    change_column_default(:answers, :correct, from: nil, to: false)
    
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:users, :username, false)
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :title, false)
    change_column_null(:answers, :correct, false)
  end
end
