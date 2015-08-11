class CourtsController < ApplicationController
  before_action :authenticate_user, only: [:new]

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  def show
  		@courts = Court.all
  		@court_array = []

  		@courts.each do |court_element|
  			add_element_if_not_present(court_element.court_number)
  		end

  		court_parent_array = []
  		@court_array.each do |court_array_element|
  			tempCourtArray = []
  			@temp_courts = Court.where(court_number: court_array_element)
  			@temp_courts.each do |court_element|
  				tempCourtArray.push(court_element)
  			end
  			court_parent_array.push(court_array_element => tempCourtArray)
  		end
  	  
    respond_to do |format|
        format.json { render json: court_parent_array, status: :ok}
    end
  end


  def new
  	@court_reservation = Court.new(court_params)
  	p params.inspect
  	p params[:court][:user_id].present?
    respond_to do |format|
      if @court_reservation.save && params[:court][:user_id].present? && params[:court][:time_from].present? && params[:court][:time_to].present?
        format.json { render :json => @court_reservation, status: :created  }
      else
        format.json { render json: @court_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def court_params
      params.require(:court).permit(:user_id, :court_number, :time_from, :time_to)
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

    def add_element_if_not_present(element)
    	if !@court_array.include?element

    			@court_array.push(element)
    	end
    end

end
