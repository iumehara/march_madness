require 'rails_helper'

RSpec.describe Round, type: :model do
  before do
    @northeast = Region.new(name: 'North East')
    @northeast.save(validate: false)
    @round_of_2 = @northeast.rounds.create(team_count: 2)
  end

  it 'should create the correct round associations' do
    round_of_4 = @northeast.rounds.create(
      next_round_id: @round_of_2.id,
      team_count: 4)

    expect(round_of_4).to be_valid
    expect(round_of_4.games.count).to eq(2)
    expect(round_of_4.next_round).to eq(@round_of_2)
    expect(@round_of_2.previous_round).to eq(round_of_4)
  end
end
