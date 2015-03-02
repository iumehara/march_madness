# teams_array is an array of arrays, with seed# in the first position, and
# entry_name in the second position.
# The [seed, name] arrays should be ordered as they are to be shown in the
# the bracket, from top to bottom.

teams_array = [
  [1, 'University of Kentucky'],
  [16, 'University of Oklahoma'],
  [8, 'University of Kansas'],
  [9, 'Notre Dame University'],
  [5, 'University of Wisconsin'],
  [12, 'University of Iowa'],
  [4, 'Duke University'],
  [13, 'University of Utah'],
  [3, 'Gonzaga University'],
  [14, 'University of Maryland'],
  [6, 'Villanova University'],
  [11, 'Wichita State University'],
  [7, 'University of Arizona'],
  [10, 'University of Northern Iowa'],
  [2, 'University of Virginia'],
  [15, 'University of North Carolina']
]

region = Region.find(1)
starting_round = region.starting_round
starting_games = starting_round.games
current_index = -1
starting_games.each_with_index do |game, _game_index|
  game.slots.each_with_index do |slot, _slot_index|
    current_index += 1
    Team.create(
      region_id: region.id,
      seed: teams_array[current_index][0],
      name: teams_array[current_index][1],
      slot_id: slot.id
    )
  end
end
