class ActivityCostsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new]

  def new
    @group = Group.find(group_id = 5)
    @activity_cost = ActivityCost.new
    authorize @activity_cost
    @members = @group.members
  end
end
