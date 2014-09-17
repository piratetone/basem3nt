class AddStateAndFriendToGames < ActiveRecord::Migration
  def change
    add_column :games, :state, :string
    add_column :games, :friend_id, :integer
  	add_index :games, :state
  	add_index :games, [ :user_id, :friend_id ]

  end
end
