class SplitsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index, :create, :update]

  def index
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @currency_symbol = ISO4217::Currency.from_code(@activity_cost.currency).symbol
    @splits = policy_scope(Split)
    @splits = @activity_cost.splits
    @balance = @activity_cost.total_balance
    @splits.each do |split|
      if split.status == true
        split.individual_balances = 0.0 if split.individual_balances == nil
        @balance = (@balance - split.individual_balances).round(2)
      end
    end
    @balance == 0.01 || @balance == -0.01 ? @activity_cost.outstanding = 0.00 : @activity_cost.outstanding = @balance
    @activity_cost.update(outstanding: @activity_cost.outstanding)
    authorize @splits
  end

  def update
    # @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @split = Split.find(params[:id])
    authorize @split
    @split.update(split_params)
    redirect_to activity_cost_splits_path(@split.activity_cost, anchor: "split-#{@split.id}")
  end

  private

  def split_params
    params.require(:split).permit(:status, :individual_balances)
  end
end

