class FavouriteStatusesController < ApplicationController
  before_action :load_user

  def index
    @favourite_statuses = @user.favourite_statuses.page(params[:page])
  end

  def create
    @status = @user.favourite_statuses.build(status_params)
    if @success = @status.save
      flash.now[:success] = "Favorited"
    else
      flash.now[:alert] = "Some error occurred"
    end
  end

  private

  def status_params
    params.require(:favourite_status).permit(:status, :member_id)
  end
end
