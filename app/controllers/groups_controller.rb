class GroupsController < ApplicationController
    before_action :set_group, only: [ :show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [ :new, :create ]

  def index
     @groups = policy_scope(Group).order(created_at: :desc)
  end

  def show
  end

  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user if user_signed_in?
    if @group.save
      redirect_to new_group_member_path(@group), notice: 'Group was successfully created.'
    else
      render :new
    end
    authorize @group
    raise
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def set_group
    @group = Groups.find(params[:id])
    authorize @group
  end

  def group_params
    params.require(:group).permit(:group_name)
  end
end
