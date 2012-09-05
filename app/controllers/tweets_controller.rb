class TweetsController < ApplicationController
  def index
    render json: Tweet.for_hashtag(params[:hashtag]).includes(:twitter_user).order("created_at desc").first(10)
  end

  def random
    render json: Tweet.order("random()").includes(:twitter_user).first
  end
end