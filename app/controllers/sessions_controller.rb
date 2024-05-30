class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:return_to) || root_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session.destroy
    @current_user = nil

    redirect_to login_path
  end
end
