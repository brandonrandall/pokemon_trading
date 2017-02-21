class CreateRewardFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :reward_favorites do |t|
      t.references :user, foreign_key: true
      t.references :reward, foreign_key: true
    end
  end
end
