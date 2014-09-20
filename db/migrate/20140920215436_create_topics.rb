class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :user_id
      t.datetime :time

      t.timestamps
    end
  end
end
