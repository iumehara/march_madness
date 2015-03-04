class RegionsController < ApplicationController
  def show
    @region = Region.first
    @rounds = @region.rounds
    @team = Team.new
    if params[:bracket_id].present?
      @bracket = Bracket.find(params[:bracket_id])
      @tournament = Tournament.find(@bracket.tournament_id)
    end
  end
end
