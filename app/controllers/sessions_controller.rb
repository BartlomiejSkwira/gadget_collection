class SessionsController < ApplicationController
  def new
    if signed_in?
      user = User.find_by_remember_token(session[:remember_token])
      redirect_to user_path(user)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) if params[:session] && params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_url
  end

end
