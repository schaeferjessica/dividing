class SplitsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index, :create]

  def new
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @split = Split.new
    authorize @split
  end

  def create
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @split = Split.new(split_params)
    @members = @activity_cost.group.members
    total_cost = @activity_cost.total_balance

    if @split.split_type == 'evenly'
      @activity_cost.split_type = 'evenly'
      @activity_cost.save
      @members.each do |member|
        @split.activity_cost = @activity_cost
        @split.member = member
        @split.individual_balances = total_cost / @members.length
        @split.split_type = 'evenly'

        if member.name == @activity_cost.paid_by
          @split.status = true
        end

        unless @split.save
          render :new
        end
        @split = Split.new
      end
    else
      @activity_cost.split_type = 'individualy'
      @activity_cost.save

      @members.each do |member|
        @split.activity_cost = @activity_cost
        @split.member = member.id
        @split.split_type = 'individualy'

        if member.name == @activity_cost.paid_by
          @split.status = true
        end

        unless @split.save
          render :new
        end
        @split = Split.new
      end
    end
    redirect_to activity_cost_splits_path, notice: 'Split was successfully created'
    authorize @split
  end

  def index
    @splits = policy_scope(Split)
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @splits = @activity_cost.splits
    authorize @splits
  end

  private

  def split_params
    params.require(:split).permit(:split_type)
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
      @split.individual_balances = @activity_cost.total_balance / @members.length if split_type = 'evenly'
      @split.status = true if member.name == @activity_cost.paid_by
      render :new unless @split.save
    end
  end
end
