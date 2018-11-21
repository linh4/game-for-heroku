class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :player, class_name: "player", foreign_key: "player_id"
      t.timestamps
    end
  end
end
