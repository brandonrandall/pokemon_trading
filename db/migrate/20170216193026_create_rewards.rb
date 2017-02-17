class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :cost
      t.integer :status

      t.timestamps null: false
    end
  end
end
