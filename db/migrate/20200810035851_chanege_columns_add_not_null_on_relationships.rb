class ChanegeColumnsAddNotNullOnRelationships < ActiveRecord::Migration[6.0]
  def change
    change_column_null :relationships, :following_id, false
    change_column_null :relationships, :follower_id, false
  end
end
