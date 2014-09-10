class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picture, :string
    add_column :users, :location, :string
    add_column :users, :gamertag, :string
    add_column :users, :full_name, :string
    add_column :users, :bio, :text
    add_column :users, :twitter, :string
    add_column :users, :twitch, :string
    add_column :users, :steam, :string
    add_column :users, :psn, :string
  end
end
