class GadgetsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.includes(:gadgets).find_by_id(params[:user_id])
    else
      redirect_to root_path
    end
  end
end
