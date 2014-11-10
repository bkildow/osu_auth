require_dependency 'osu_auth/application_controller'

module OsuAuth
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /admin/users
    def index
      @users = User.all
      # authorize @users
    end

    # GET /admin/users/1
    def show
    end

    # GET /admin/users/new
    def new
      @user = User.new
      # authorize @user
    end

    # GET /admin/users/1/edit
    def edit
    end

    # user /users
    def create
      @user = User.new(user_params)
      # authorize @user

      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: 'User was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /users/1
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'user was successfully destroyed.' }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      # authorize @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :name_n)
    end
  end
end
