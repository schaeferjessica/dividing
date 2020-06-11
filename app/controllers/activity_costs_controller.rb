class ActivityCostsController < ApplicationController
before_action :set_activity_cost, only: [:edit, :update, :destroy]
skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @group = Group.find(params[:group_id])
    @members = @group.members
    @activity_cost = ActivityCost.new
    authorize @activity_cost

  end

  def create
    @group = Group.find(params[:group_id])
    @members = @group.members
    @activity_cost = ActivityCost.new(activity_cost_params)
    @activity_cost.group = @group


    if @activity_cost.save
      @activity_cost.employer_contribution = 0.0 if @activity_cost.employer_contribution == nil
      @activity_cost.service_tip = 0.0 if @activity_cost.service_tip == nil
      @activity_cost.total_balance = (@activity_cost.actual_cost + @activity_cost.service_tip - @activity_cost.employer_contribution).round(2)
      @activity_cost.save
      split_cost(@activity_cost.split_type)
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
      @activity_cost.employer_contribution = 0.0 if @activity_cost.employer_contribution == nil
      @activity_cost.service_tip = 0.0 if @activity_cost.service_tip == nil
      @activity_cost.total_balance = (@activity_cost.actual_cost + @activity_cost.service_tip - @activity_cost.employer_contribution).round(2)
      @activity_cost.update(total_balance: @activity_cost.total_balance)
      split_destroy
      split_cost(@activity_cost.split_type)
      redirect_to activity_cost_splits_path(@activity_cost), notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
   if @activity_cost.destroy
    redirect_to groups_path
   end
  end

  private

  def activity_cost_params
    params.require(:activity_cost).permit(:actual_cost, :service_tip, :employer_contribution, :currency, :paid_by, :split_type)
  end

  def set_activity_cost
    @activity_cost = ActivityCost.find(params[:id])
    @members = @activity_cost.group.members
    authorize @activity_cost
  end

  def split_cost(split_type)
    @members = @activity_cost.group.members
    @activity_cost.split_type = split_type
    @activity_cost.save
    @members.each do |member|
      @split = Split.new
      @split.activity_cost = @activity_cost
      @split.member = member
      @split.split_type = split_type
      split_type == 'evenly'? @split.individual_balances = (@activity_cost.total_balance / @members.length).round(2) : @split.individual_balances = 0
      @split.status = true if member.name == @activity_cost.paid_by
      render :new unless @split.save
    end
  end

  def split_destroy
    @activity_cost = ActivityCost.find(params[:id])
    @splits = @activity_cost.splits
    @splits.each do |split|
      split.destroy
    end
  end
end
