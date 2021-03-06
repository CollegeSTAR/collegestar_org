class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_campuses_with_null, only: [:new]

  # GET /users
  def index
    @users = User.order(:last_name, :first_name, :email).page params[:page]
    authorize @users
  end

  # GET /users/1
  def show
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
    @user_categories = UserCategory.selectable
  end

  # GET /users/1/edit
  def edit
    @campuses = Campus.all    
    @roles = Role.grantable.order(:description)
    @password_updater = PasswordUpdater.new
    authorize @user
  end

  # POST /users
  def create
    @user = User.new(create_user_params)
    if @user.save
      create_session( 
        email: @user.email,
        password: @user.password
      )
      handle_custom_user_category()
      redirect_to profile_path(@user), notice: 'Thank you for signing up!'
    else
      set_campuses_with_null
      @user_categories = UserCategory.selectable
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    authorize @user
    
    # Non Grantable user roles will not be included in the user_params, we need
    # to merge them in or they will be wiped out on update.
    result = AssignUserRoles.call(user: @user, user_params: user_params)
    if @user.update( user_params.merge(role_ids: result.role_ids) )
        redirect_to edit_profile_path(@user), notice: 'User was successfully updated.'
    else
      @campuses = Campus.all
      @roles = Role.all
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    authorize @user
    @user.destroy
    redirect_to users_url, notice: 'Successfully removed user.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_campuses_with_null
      @campuses = Campus.all
      @campuses = @campuses.to_a
      @campuses << NullCampus.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_user_params
      params.require(:user).permit(
        :first_name, 
        :last_name, 
        :email, 
        :password, 
        :password_confirmation, 
        :campus_id, 
        :department,
        user_category_ids: []
      )
    end
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :campus_id, :department, role_ids: [])
    end

    def other_user_category?
      return false if params[:other_user_category] == ""
      return true
    end

    def handle_custom_user_category
      if other_user_category?
        custom_user_category = UserCategory.create name: params[:other_user_category], selectable: false
        @user.user_categories << custom_user_category
      end
    end
end
