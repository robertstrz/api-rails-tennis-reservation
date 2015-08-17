class ReservationController < ApplicationController
  before_action :authenticate_user, only: [:new]

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  def new
    @reservation = Reservation.new(reservation_params)
    respond_to do |format|
      if @reservation.save && params[:reservation][:user_id].present? && params[:reservation][:from].present? && params[:reservation][:to].present?
        format.json { render :json => @reservation, status: :created }
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :court_id, :from, :time, :date)
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  protected
  def json_request?
    request.format.json?
  end

  def authenticate_user
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(access_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end
end
