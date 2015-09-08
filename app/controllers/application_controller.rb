class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  include SessionsHelper

  # skip_before_action :require_login, if: :json_request?
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :require_login, :unless => :json_request?

  private
  def require_login
    if !logged_in?
      redirect_to main_app.root_path
    end
  end

  def json_request?
    request.format.json?
  end

end
