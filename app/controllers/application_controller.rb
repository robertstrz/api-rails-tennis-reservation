class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login

  private
  def require_login
    if !logged_in? && !json_request?
      redirect_to root_url
    end
  end

  def json_request?
    request.format.json?
  end

end
