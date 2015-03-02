class Round < ActiveRecord::Base
  belongs_to :region

  belongs_to :next_round, class: Round
  has_one :previous_round, class: Round, foreign_key: :next_round_id

  has_many :games

  has_many :slots, through: :games

  after_create :create_games

  private

  def create_games
    if next_round.nil?
      games.create
    else
      next_round.games.each do |next_round_game|
        2.times do |_index|
          games.create(next_game_id: next_round_game.id)
        end
      end
    end
    end
end
