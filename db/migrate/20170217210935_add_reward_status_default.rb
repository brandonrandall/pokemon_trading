class AddRewardStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:rewards, :status, 1)
  end
end
