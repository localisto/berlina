class TweetsController < ApplicationController
  def index
    render json: Tweet.for_hashtag(params[:hashtag]).order("created_at desc").first(10)
  end
end