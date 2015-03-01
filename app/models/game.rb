class Game < ActiveRecord::Base
	belongs_to :round

	belongs_to :next_game, class: Game
	has_many :previous_games, class: Game, foreign_key: :next_game_id

end
