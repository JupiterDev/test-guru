class AddNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:users, :username, false)
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :title, false)
    change_column(:tests, :level, :integer, default: 1)
    change_column(:answers, :correct, :boolean, default: false)
  end
end
