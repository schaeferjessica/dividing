class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [ :new, :create ]

  def index
     @groups = policy_scope(Group).order(created_at: :desc)
     authorize @groups
  end

  def show
  end

  def new
    @group = Group.new
    authorize @group
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user = current_user if user_signed_in?
    if @group.save
      redirect_to new_group_member_path(@group), notice: 'Group was successfully created.'
    else
      render :new
    end
    authorize @group
  end

  def edit
    @member = Member.new
  end

  def update
    if @group.update(group_params)
      redirect_to edit_group_path, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to request.referrer
  end

  private

  def set_group
    @group = Group.find(params[:id])
    authorize @group
  end

  def group_params
    params.require(:group).permit(:group_name)
  end
end
