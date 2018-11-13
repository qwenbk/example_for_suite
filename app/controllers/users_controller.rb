class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:roles).all.order(created_at: :desc)
  end

  def change
    # id = params[:id].to_i
    # session[:id] = User::ROLES.has_key?(id) ? id : 0
    id = Role.find(params[:data])

    user_session[:role_id] = [id.name, id.description, Filial.where(:name => id.description).ids]
    User.current_role = [id.name, id.description, Filial.where(:name => id.description).ids]
    flash[:notice] = "Ваша новая роль #{User.current_role[0] + " " + User.current_role[1]} Была активирована!"
      # raise "QQQ"
      # person_session[:role].clear
    redirect_to root_path

  end
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    # unless @user == current_user
    #   redirect_to :root, :alert => "У вас не прав."
    # end
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
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
      params.require(:user).permit(:first_name, :second_name, :last_name, :email, :password, :password_confirmation, role_users_attributes: [:id, :_destroy, :role_id, :user_id])
    end
end
