class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:getuserreservations, :destroy, :create, :new]


  protect_from_forgery
  # skip_before_action :verify_authenticity_token, if: :json_request?
  skip_before_filter :require_login

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getreservations
    @city = City.find_by(id: params[:reservation][:id])
    offset = params[:reservation][:offset]
    @reservationDay = Date.today + offset
    @getreservations = Reservation.where "DATE(time_from) = ?", Date.today + offset
    puts @getreservations
  end

  def getuserreservations
    @userreservations = Reservation.order(time_to: :desc).where "user_id = ? AND time_to > ?", @user.id, Time.now - 3.hours
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:court_id, :user_id, :time_from, :time_to, :day)
    end


  def authenticate_user
    if verified_request?
      puts "AAAAAAAAAAAAA"
      authenticate_token || render_unauthorized
    else
      puts "BBBBBAAAAAAAAAAAA"
      logged_in?
    end
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(access_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end
end
