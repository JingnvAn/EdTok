class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: %i[ show edit update destroy ]
  
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    if params[:id]
      @user = User.find(params[:id])
    else 
      @user = current_user
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to profile_url
    else 
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to profile_url
    else 
      render 'edit'
    end
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: "User was successfully updated." }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def follow 
    Follow.create(user_id: current_user.id, following_id: params[:id_for_follow])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      else 
        @user = current_user
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :bio, :password, :password_confirmation)
    end

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
