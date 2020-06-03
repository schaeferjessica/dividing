class MembersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :destroy ]
  def new
    @member = Member.new
    @group = Group.find(params[:group_id])
    authorize @member
  end

  def create
    @member = Member.new(member_params)
    @member.user = current_user if user_signed_in?
    @group = Group.find(params[:group_id])
    if @member.save
      GroupMember.create(group: @group, member: @member)
      redirect_to new_group_member_path(@group), notice: 'Member was successfully added.'
    else
      render :new
    end
    authorize @group
  end

  def destroy
    @member = Member.find(params[:id])
    @group = Group.find(params[:group_id])
    authorize @group
    @member.destroy
    redirect_to new_group_member_path(@group)
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end
