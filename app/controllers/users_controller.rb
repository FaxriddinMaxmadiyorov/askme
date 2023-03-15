class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'success register'
    else
      flash.now[:alert] = 'incorrect input'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    byebug
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: 'success update'
    else
      flash.now[:alert] = 'incorrect update'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    byebug

    redirect_to root_path, notice: 'user deleted'
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end
