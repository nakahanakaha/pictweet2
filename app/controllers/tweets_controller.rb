class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per(3)
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  def tweet_params
    params.permit(:name, :image, :text)
  end

end
