class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:target_path) || root_path
    else
      flash.now[:alert] = "Are you a Guru? Verify your Email and Password please"
      render :new
    end
    session[:target_path] = nil
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
