class GroupsController < ApplicationController
    before_action :set_group, only: [ :show, :edit, :update, :destroy]

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
    @group.user = current_user
    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
    authorize @group
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
