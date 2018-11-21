class AddHighestLevelToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :highest_level, :integer, default: 1
  end
end
