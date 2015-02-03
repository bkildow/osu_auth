require_dependency 'osu_auth/application_controller'

module OsuAuth
  class RolesController < ApplicationController
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    # Make sure all actions are authorized
    after_action :verify_authorized

    # GET /roles
    def index
      @roles = Role.all
      authorize @roles
    end

    # GET /roles/1
    def show
    end

    # GET /roles/new
    def new
      @role = Role.new
      @permissions = Permission.all
      authorize @role
    end

    # GET /roles/1/edit
    def edit
    end

    # POST /roles
    def create
      authorize Role.new
      @role = RoleForm.new(role_params)


      if @role.save
        redirect_to roles_path, notice: 'Role was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /roles/1
    def update
      @role = RoleForm.new(role_params)

      if @role.save
        redirect_to roles_path, notice: 'Role was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /roles/1
    def destroy
      @role.destroy
      redirect_to roles_url, notice: 'Role was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
        authorize @role
      end

      # Only allow a trusted parameter "white list" through.
      def role_params
        params.require(:role).permit(:id, :name, permission_ids: [])
      end
  end
end
