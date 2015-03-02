class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]

  def create
    @selection = Selection.new(selection_params)

    if @selection.save
      redirect_to @selection, notice: 'Selection was successfully created.'
    else
      render :new
    end
  end

  def update
    if @selection.update(selection_params)
      redirect_to @selection, notice: 'Selection was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_selection
    @selection = Selection.find(params[:id])
  end

  def selection_params
    params.require(:selection).permit(:team_id, :slot_id, :region_id)
  end
end
