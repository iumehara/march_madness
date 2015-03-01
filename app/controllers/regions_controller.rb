class RegionsController < ApplicationController
  def index
  end

  def show
    @region = Region.first
    @rounds = @region.rounds
  end
end
