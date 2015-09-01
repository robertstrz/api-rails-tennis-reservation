class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login

  private
  def require_login
    if !logged_in? && !verified_request?
      redirect_to main_app.root_path
    end
  end

  # def json_request?
  #   request.format.json?
  # end

  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super()
    end
  end

  def json_request?
    request.format.symbol == :json
  end

end
