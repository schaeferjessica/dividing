class ActivityCostsController < ApplicationController
before_action :set_activity_cost, only: [:edit, :update]
skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @group = Group.find(params[:group_id])
    @members = @group.members
    @activity_cost = ActivityCost.new
    authorize @activity_cost

  end

  def create
    @group = Group.find(params[:group_id])
    @activity_cost = ActivityCost.new(activity_cost_params)
    @activity_cost.group = @group
    @activity_cost.total_balance = @activity_cost.actual_cost + @activity_cost.service_tip - @activity_cost.employer_contribution

    if @activity_cost.save
      redirect_to activity_cost_splits_path(@activity_cost), notice: 'Activity Cost was successfully created.'
    else
      render :new
    end
    authorize @activity_cost
  end

  def edit
    @group = Group.find(params[:group_id])
    @members = @group.members
  end

  def update
    if @activity_cost.update(activity_cost_params)
        @activity_cost.total_balance = @activity_cost.actual_cost + @activity_cost.service_tip - @activity_cost.employer_contribution
        @activity_cost.update(total_balance: @activity_cost.total_balance)
      redirect_to activity_cost_splits_path(@activity_cost), notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  private

  def activity_cost_params
    params.require(:activity_cost).permit(:actual_cost, :service_tip, :employer_contribution, :currency, :paid_by, :split_type)
  end

  def set_activity_cost
    @activity_cost = ActivityCost.find(params[:id])
    authorize @activity_cost
  end
end
