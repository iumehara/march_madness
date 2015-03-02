class TeamsController < ApplicationController
  before_action :region_not_locked

  def create
    @team = Team.create(team_params)
    @slot = Slot.find(team_params[:slot_id])
    respond_to { |format| format.js }
  end

  def edit
    @team = Team.find(params[:id])
    @slot = Slot.find(params[:slot_id])
    respond_to { |format| format.js }
  end

  def update
    @team = Team.find(params[:id])
    @slot = Slot.find(team_params[:slot_id])
    @team.update(team_params)
    respond_to { |format| format.js }
  end

  private

  def region_not_locked
    if Team.where(id: params[:id]).present?
      region = Team.find(params[:id]).region
      redirect_to region unless region.status == 0
    end
  end

  def team_params
    params.require(:team).permit(:region_id, :seed, :name, :slot_id)
   end
end
