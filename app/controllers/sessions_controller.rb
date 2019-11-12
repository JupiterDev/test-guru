class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back(fallback_location: root_path)
      # не понял, как реализовать переход на запрашиваемую страницу
    else
      flash.now[:alert] = "Are you a Guru? Verify your Email and Password please"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
