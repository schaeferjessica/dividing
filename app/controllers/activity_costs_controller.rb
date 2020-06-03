class ActivityCostsController < ApplicationController
before_action :set_activity_cost, only: [:edit, :update]
skip_before_action :authenticate_user!, only: [:new]

  def new
    @group = Group.find(group_id = 1)
    @members = @group.members
    @activity_cost = ActivityCost.new
    authorize @activity_cost

  end

  def create
    @group = Group.find(group_id = 1)
    @activity_cost = ActivityCost.new(activity_cost_params)
    @activity_cost.group = @group

    if @activity_cost.save
      redirect_to new_activity_cost_split_path(@activity_cost), notice: 'Activity Cost was successfully created.'
    else
      render :new
    end
    authorize @activity_cost
  end

  def edit
    @group = Group.find(group_id = 1)
    @members = @group.members
  end

  def update
    if @activity_cost.update(activity_cost_params)
      redirect_to new_activity_cost_split_path(@activity_cost), notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  private

  def activity_cost_params
    params.require(:activity_cost).permit(:actual_cost, :service_tip, :employer_contribution, :currency, :paid_by)
  end

  def set_activity_cost
    @activity_cost = ActivityCost.find(params[:id])
    authorize @activity_cost
  end
end
