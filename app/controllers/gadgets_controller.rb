class GadgetsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.includes(:gadgets).find_by_id(params[:user_id])
    else
      redirect_to root_path
    end
  end

  def edit
    if params[:id]
      @user = User.find(params[:user_id])
      @gadget = Gadget.find(params[:id])
    end
  end
end
