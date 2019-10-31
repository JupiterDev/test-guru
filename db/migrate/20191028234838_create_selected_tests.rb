class CreateSelectedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :selected_tests do |t|

      t.timestamps
    end
  end
end
