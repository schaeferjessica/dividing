class MembersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
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
      GroupMember.new(group: @group, member: @member)
      redirect_to new_group_member_path(@group), notice: 'Member was successfully added.'
    else
      render :new
    end
    authorize @group
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end
