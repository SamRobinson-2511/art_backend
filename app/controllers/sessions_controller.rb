class SessionsController < ApplicationController

    skip_before_action :authorized, only:[:create]

    def create 
        @viewer = Viewer.find_by(email: params[:email])    
        if @viewer and @viewer.authenticate( params[:password] )
            logged_viewer = JWT.encode( {viewer: @viewer.id}, ENV['JWT_TOKEN'])
            render json: { uid: logged_viewer }, status: :ok
        else
            render json: { errors: ['Invalid email or password'] }, status: :unauthorized
        end
    end

    def destroy
        session.delete(viewer.id)
        head :no_content
    end
end