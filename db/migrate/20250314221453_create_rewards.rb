class CreateRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :rewards do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.integer :reward_points_required, null: false, unsigned: true

      t.timestamps
    end
  end
end
