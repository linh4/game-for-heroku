class Game < ApplicationRecord
  belongs_to :player

  def self.high_scores
    if Game.all.size < 2
      Game.all.first
    else
      size = Game.all.length < 10 ? Game.all.length : 10
      Game.order(highest_level: :desc).select{|game| !game.highest_level.nil?}.take(10)
    end
  end

  def is_high_score_game?
    Game.high_scores
  end
end
