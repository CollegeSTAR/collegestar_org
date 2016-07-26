class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:last_name, :first_name, :email).page params[:page]
    authorize @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user, :show?
  end

  # GET /users/new
  def new
    @user = User.new
    @campuses = Campus.all
  end

  # GET /users/1/edit
  def edit
    @campuses = Campus.all
    authorize @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(create_user_params)
    respond_to do |format|
      if @user.save
        create_session( 
          email: @user.email,
          password: @user.password
        )
        format.html { redirect_to profile_path(@user), notice: 'Thank you for signing up!' }
        format.json { render :show, status: :created, location: profile_path(@user) }
      else
        @campuses = Campus.all
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Successfully removed user.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :campus_id, :department)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :campus_id, :department)
    end
end
