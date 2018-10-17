class ApplicationController < ActionController::Base

  def index
    @weather = Weather.new
    @five_day_forecast = @weather.five_day_forecast
  end

end
