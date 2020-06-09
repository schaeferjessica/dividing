class SplitsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index, :create, :update]

  def index
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @currency_symbol = ISO4217::Currency.from_code(@activity_cost.currency).symbol
    @splits = policy_scope(Split)
    @splits = @activity_cost.splits
    authorize @splits
  end

  def update
    @split = Split.find(params[:id])
    authorize @split
    @split.update(split_params)
    redirect_to activity_cost_splits_path(@split.activity_cost)
  end

  private

  def split_params
    params.require(:split).permit(:status, :individual_balances)
  end
end

