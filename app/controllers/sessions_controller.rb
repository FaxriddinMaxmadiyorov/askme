class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:session)
    byebug
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'you signed'
    else
      flash.now[:alert] = 'incorrect email or password'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'you signed out'
  end
end
