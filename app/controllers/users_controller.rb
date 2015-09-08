class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        msg = {token: @user.access_token, user_id: @user.id, user_name: @user.name, user_email: @user.email}
        format.json { render json: msg, status: :created }
      else
        format.html { render :new }
        format.json { render json: {"error" => @user.errors.full_messages[0]}, status: :unprocessable_entity }
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
    @user = User.find_by(email: params[:user][:email])
    if @user != nil && @user.authenticate(params[:user][:password])
      msg = {token: @user.access_token, user_id: @user.id, user_name: @user.name, user_email: @user.email}
      render json: msg
    else
      render json: {"error" => "User not found"}, status: :not_found
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

  def authenticate_admin
    if !is_admin?
      redirect_to static_pages_unauthorized_path
    end
  end

  def authenticate_user
    if json_request?
      authenticate_token || render_unauthorized
    elsif !logged_in?
      redirect_to main_app.root_path
    end
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
