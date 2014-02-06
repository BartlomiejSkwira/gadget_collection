class GadgetsController < ApplicationController
  def index
    if params[:user_id].present?
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

  def update
    @user = User.find(params[:user_id])
    @gadget = Gadget.find(params[:id])
    if @gadget.update(gadget_params)
      redirect_to user_gadgets_path
    else
      render 'edit'
    end
  end

  def new
    if params[:user_id]
      @user = User.find(params[:user_id])
      @gadget = @user.gadgets.new
    end
  end

  def create
    @user = User.find(params[:user_id])
    @gadget = @user.gadgets.new(gadget_params)
    if @gadget.save
      redirect_to user_gadgets_path
    else
      render 'new'
    end
  end

  def playlist
    if params[:id]
      gadget = Gadget.find(params[:id])
      playlist = gadget.images.map(){ |image| { title: image.file_name,
                                     image: image.file.url } }
      render json: playlist
    end
  end

  private
    def gadget_params
      params.require(:gadget).permit(:name, images_attributes: [:id, :file, :_destroy])
    end
end
