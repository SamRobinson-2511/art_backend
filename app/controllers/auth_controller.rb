class AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    def login
        viewer = Viewer.find_by(email: params[:email])
        if viewer && viewer.authenticate(params[:password])
            token = encode_token({viewer_id: viewer.id})
            render json: {viewer: viewer, jwt: token}
        else
            render json: {error: '400', msg: ["Invalid email or password"]}
        end
    end
end
