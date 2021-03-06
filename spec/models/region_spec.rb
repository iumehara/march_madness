require 'rails_helper'

RSpec.describe Region, type: :model do
  before do
    @north_east = Region.create(name: 'North East')
  end

  it 'creates successfully' do
    expect(@north_east).to be_valid
    expect(@north_east.name).to eq('North East')
  end

  describe 'rounds creation' do
    it 'creates the correct number of rounds' do
      expect(@north_east.rounds.count).to eq(ROUNDS_PER_REGION)
    end
    it 'created the rounds in the correct order' do
      rounds = @north_east.rounds
      rounds.each_with_index do |round, index|
        expect(round.previous_round).to eq(rounds[index + 1])
        if index > 0
          expect(round.next_round).to eq(rounds[index - 1])
        end
      end
    end
    it 'creates exactly one starting round' do
      expect(Round.where(starting_round: true).count).to eq(1)
    end
  end

  it 'creates the correct number of games' do
    games_count = (2**ROUNDS_PER_REGION) - 1
    expect(@north_east.games.count).to eq(games_count)
  end
end
