class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_url, notice: "タスク「#{@tweet.message}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url, notice: "タスク「#{@tweet.message}」を削除しました。"
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_url, notice: "タスク「#{@tweet.message}」を更新しました。"
    else
      render :edit
    end
  end
end


private
  def tweet_params
    params.require(:tweet).permit(:message)
  end

