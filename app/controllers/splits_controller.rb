class SplitsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index, :create]

  # def new
  #   @activity_cost = ActivityCost.find(params[:activity_cost_id])
  #   @split = Split.new
  #   authorize @split
  # end

  # def create
  #   @activity_cost = ActivityCost.find(params[:activity_cost_id])
  #   @split = Split.new(split_params)
  #     split_cost(@split.split_type)
  #   redirect_to activity_cost_splits_path, notice: 'Split was successfully created'
  #   authorize @split
  # end

  def index
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    if @activity_cost.splits.empty?
      split_cost(@activity_cost.split_type)
    else
      split_destroy
      split_cost(@activity_cost.split_type)
    end
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
    params.require(:split).permit(:status)
  end

  def split_cost(split_type)
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @members = @activity_cost.group.members
    @activity_cost.split_type = split_type
    @activity_cost.save
    @members.each do |member|
      @split = Split.new
      @split.activity_cost = @activity_cost
      @split.member = member
      @split.split_type = split_type
      split_type = 'evenly'? @split.individual_balances = (@activity_cost.total_balance / @members.length).round(2) : @split.individual_balances = 0
      @split.status = true if member.name == @activity_cost.paid_by
      render :new unless @split.save
    end
  end

  def split_destroy
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @splits = @activity_cost.splits
    @splits.each do |split|
      split.destroy
    end
  end
end

