class SplitsController < ApplicationController

  def new
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @split = Split.new
    authorize @split
  end

  # def create
  #   @activity_cost = ActivityCost.find(params[:activity_cost_id])

  #   @split = Split.new(activity_cost_params)
  #   @split.activity_cost = @activity_cost
  #   @members = @activity_cost.group.members
  #   @total_cost = @activity_cost.total_balance

  #   @members.each do |member|
  #     @split.individual_balances =
  #   end





  #   if @split.save
  #     redirect_to new_activity_cost_split_path(@activity_cost), notice: 'Split was successfully created.'
  #   else
  #     render :new
  #   end
  #   authorize @split
  # end

  # private

  # def split_params
  #   params.require(:split).permit(:split_type)
  # end
end
