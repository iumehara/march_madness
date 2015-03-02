class Slot < ActiveRecord::Base
  belongs_to :game
  belongs_to :team

  def starting_slot?
    game && game.round && game.round.starting_round
  end
end
