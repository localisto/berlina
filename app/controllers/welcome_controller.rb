class WelcomeController < ApplicationController
  def index
    @events = Event.order("start_time").includes(:organization)
  end
end