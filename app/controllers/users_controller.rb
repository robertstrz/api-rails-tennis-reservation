class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update, :destroy, :set_user]

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    # respond_to do |format|
    #   if @user != nil
    #     format.html { redirect_to @user, notice: 'This is my user.' }
    #     format.json { render json: @user, status: :ready, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    puts "JESTEM TU"
    p @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        msg = { token: @user.access_token, user_id: @user.id, user_name: @user.name, user_email: @user.email }
        format.json { render json: msg, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        p @user.errors
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def gettoken
      puts params.inspect
      @user = User.find_by(email: params[:user][:email])
      if @user != nil && @user.authenticate(params[:user][:password])
          msg = { token: @user.access_token, user_id: @user.id, user_name: @user.name, user_email: @user.email }
          render json: msg
        else
          render json: {"error"=>"User not found"}, status: :not_found
        end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password)
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
