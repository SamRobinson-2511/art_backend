class ViewersController < ApplicationController

    skip_before_action :authorized, only: [:create, :show, :update]

    def profile
        render json: {viewer: current_viewer}
    end

    def create
        viewer = Viewer.create!(viewer_params)
        if !viewer.valid?
            render json: {error: "400", msg: "Error creating viewer"}
        else
            render json: {viewer: viewer, jwt: encode_token(viewer_id: viewer.id)}, status: :created
        end
    end
        
    def show
        viewer = Viewer.find_by(params[:id])
        render json: viewer
    end

    def update 
        viewer = Viewer.find_by(id: params[:id])
        viewer.update(user_params)
        render json: viewer
    end

    def delete 
        viewer = Viewer.find_by(id: params[:id])
        viewer.delete
        render json: viewer
    end

    private

    def viewer_params
        params.permit(:first_name, :last_name, :password, :password_confirmation, :email, :zip_code)
    end
end


    


