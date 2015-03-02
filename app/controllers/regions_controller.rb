class RegionsController < ApplicationController
  def show
    @region = Region.first
    @rounds = @region.rounds
    @team = Team.new
  end
end
