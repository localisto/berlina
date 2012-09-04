class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @event.update_tweets!
    @tweets = @event.tweets.order("created_at desc")
  end
end