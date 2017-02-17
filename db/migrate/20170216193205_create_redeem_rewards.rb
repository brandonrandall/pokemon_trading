class CreateRedeemRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :redeem_rewards do |t|
      t.references :user, foreign_key: true
      t.references :reward, foreign_key: true

      t.timestamps null: false
    end
  end
end
