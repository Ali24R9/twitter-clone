class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to user_path(@user)
    else
      render 'index'
    end
  end

  def show
    @user = User.find(params[:id])
    @tweet = Tweet.new
    @tweets = Tweet.where({user_id: @user.id})
  end

private
  def user_params
    params.require(:user).permit(:email, :userhandle, :password, :password_confirmation)
  end
end
