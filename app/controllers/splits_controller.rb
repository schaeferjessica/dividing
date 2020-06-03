class SplitsController < ApplicationController

  def new
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @split = Split.new
    authorize @split
  end

  def create
  end
end
