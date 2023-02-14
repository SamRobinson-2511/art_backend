class ViewersController < ApplicationController

    before_action :authorize!, only: [:update]
    def index
        render json: Viewer.all
    end

    def show
        render json: Viewer.find(params[:id])
    end

    def create
        viewer = Viewer.create!(user_params)
        if user.valid?
            render json: { token: issue_token({ viewer_id: viewer.id }), viewer: ViewerSerializer.new(viewer)}
        else
            render json: { errors: viewer.errors.full_messages }, status: :not_acceptable
        end
    end

    def update
        viewer = Viewer.find(params[:id])
        viewer.update(viewer_params)
        render json: viewer, status: :updated
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private

    def user_params
        params.require(:viewer).permit(:first_name, :last_name, :email, :password, :zip_code)
    end
end

