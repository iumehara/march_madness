class BracketsController < ApplicationController
  def show
    @bracket = Bracket.find(params[:id])
    @region = bracket.region
    @rounds = @region.rounds
    @team = Team.new
  end
end
