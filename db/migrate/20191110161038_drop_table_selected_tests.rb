class DropTableSelectedTests < ActiveRecord::Migration[6.0]
  def up
    drop_table :tests_users, if_exists: true
    drop_table :selected_tests, if_exists: true
  end
end
