class Region < ActiveRecord::Base
  has_many :rounds
  has_many :games, through: :rounds
  has_many :teams

  after_create :create_rounds

  ROUNDS_PER_REGION.times do |index|
    team_count = 2**(index + 1)

    define_method "round_of_#{team_count}" do
      rounds.where(team_count: team_count).first
    end
  end

  private

  def create_rounds
    ROUNDS_PER_REGION.times do |index|
      next_team_count = 2**(index)
      current_team_count = 2**(index + 1)

      if rounds.where(team_count: next_team_count).present?
        next_round_id = rounds.find_by(team_count: next_team_count).id
      else
        next_round_id = nil
      end

      starting_round = index == (ROUNDS_PER_REGION - 1) ? true : false

      rounds.create(
        team_count: current_team_count,
        next_round_id: next_round_id,
        starting_round: starting_round)
    end
  end
end
