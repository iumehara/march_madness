class BracketsController < ApplicationController
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @bracket = Bracket.new
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @bracket = Bracket.new(bracket_params)
    if @bracket.save
      redirect_to region_path(
        id: @tournament.first_region.id,
        bracket_id: @bracket.id), notice: "OK #{@bracket.username}, let's fill in your bracket!"
    else
      render :new
    end
  end

  private

  def bracket_params
    params.require(
      :bracket
    ).permit(
      :username, :nickname, :password, :password_confirmation
    ).merge(
      tournament_id: params[:tournament_id]
    )
  end
end
