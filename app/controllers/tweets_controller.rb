class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.update(tweet_params)
  end
end


private
  def tweet_params
    params.require(:tweet).permit(:comment, :tdata)
  end
