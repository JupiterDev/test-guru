class CreateBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
