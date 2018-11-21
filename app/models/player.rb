class Player < ApplicationRecord
  has_many :games
  validates :name, presence: true

  attr_accessor :highest_level

  def top_score
    self.games.sort{|a, b|
      b.highest_level <=> a.highest_level
    }[0]
  end

end
