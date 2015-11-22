class MembersController < ApplicationController
  before_action :load_user

  def index
    @members = MemberService.fetch_members(ethnicity: params[:ethnicity], page: params[:page])
    @favourites = @user.favourite_statuses.where(member_id: @members.map(&:id)).pluck(:member_id)
    @api_hits = MemberService.api_hits
  end

end
