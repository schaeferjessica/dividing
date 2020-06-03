class SplitsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new]

  def new
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @split = Split.new
    authorize @split
  end

  def create
    @activity_cost = ActivityCost.find(params[:activity_cost_id])

    @split = Split.new(activity_cost_params)
    @members = @activity_cost.group.members
    total_cost = @activity_cost.total_balance

    if @split.split_type == 'evenly'
      @members.each do |member|
        @split.activity_cost = @activity_cost
        @split.member = member.id
        @split.individual_balances = total_cost / @members.length
        @split.split_type = 'evenly'

        if member.name == @activity_cost.paid_by
          @split.status = true
        end

        unless @split.save
          render :new
        end
      end

    else
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
      end
    end

    redirect_to new_activity_cost_split_path(@activity_cost), notice: 'Split was successfully created.'
    authorize @split
  end


  private

  def index
    @splits = policy_scope(Split)
    @activity_cost = ActivityCost.find(params[:activity_cost_id])
    @splits = @activity_cost.splits
    authorize @splits
  end

  def split_params
    params.require(:split).permit(:split_type)
  end
end
