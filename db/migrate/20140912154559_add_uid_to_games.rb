class AddUidToGames < ActiveRecord::Migration
  def change
    add_column :games, :uid, :integer
  end
end
