class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def datetime_of_query
    if session[:datetime_of_query].nil?
      session[:datetime_of_query] = DateTime.current
    end
    session[:datetime_of_query]
  end

  def set_datetime_of_query(datetime)
    session[:datetime_of_query] = datetime
  end
end
