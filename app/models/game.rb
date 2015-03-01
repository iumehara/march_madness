class Game < ActiveRecord::Base
  belongs_to :round

  belongs_to :next_game, class: Game
  has_many :previous_games, class: Game, foreign_key: :next_game_id

  has_many :slots

  after_create :create_slots

  private

  def create_slots
    2.times do |_index|
      slots.create
    end
    end
end
