class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @user = User.find(session[:user_id])
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      flash[:notice] = "Tweet posted!"
      respond_to do |format|
        format.html { redirect_to user_path(@user.id) }
        format.js
      @tweet.match_tag
      end
    else
      flash[:alert] = "Invalid Tweet!"
      render user_path(@user)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

private
  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id)
  end
end
