class AddUserIdToSelectedTests < ActiveRecord::Migration[6.0]
  def change
    add_column :selected_tests, :user_id, :integer
    add_column :selected_tests, :test_id, :integer
  end
end
