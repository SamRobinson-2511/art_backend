class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    before_action :authorized

    def auth_header
        request.headers["Authorization"]
    end

    def encode_token(payload)
        JWT.encode(payload, ApplicationController.secret)
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin 
                JwT.decode(token, ApplicationController.secret, true, algorithm: 'HS256')
            rescue JWT.DecodeError
                nil
            end
        end
    end
    
    def current_viewer
        if decoded_token
            viewer_id = decoded_token[0]['viewer_id']
            viewer = Viewer.find_by(id: viewer_id)
        end
    end

    def logged_in?
        !!current_viewer
    end

    def authorized
        render json: {msg: ['Please login']}, status: :unauthorized unless logged_in?
    end


    def fetch
        params = "id,title,artist_display,is_on_view,image_id"
        # params = "title,artist_display,main_reference_number,date_start,date_end,date_display,place_of_origin,dimensions,medium_display,inscriptions,credit_line,publication_history,is_on_view,gallery_title,image_id"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{params}&limit=20"))
        data = response['data']
        render json: data, status: :ok
    end
    
    def search
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks/search?q=#{params[:search]}"))
        data = response['data']
        render json: data, status: :ok
    end

    def gallery
        gallery = "title,artist_display,main_reference_number,date_start,date_end,date_display"
        url = "https://api.artic.edu/api/v1/artworks/artworks?fields=#{gallery}&limit=10"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/"))
        render json: response, status: :ok
    end

    private
    def self.secret
        "f0r_a11_7h3_m0n37_7h27_3R_7_h@d"
    end
    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 
    def record_not_found
        render json: {errors: ['Record not found']}, status: :not_found
    end
end






    #     auth_token = request.headers['auth-token']
    #     if auth_token
    #         token = JWT.decode( auth_token, ENV['JWT_TOKEN'])[0]
    #         return Viewer.find_by( id: token['viewer'])
    #     else
    #         return nil
    #     end
    # end

    # def issue_token(payload)
    #     JWT.decode(payload, ENV["JWT_TOKEN"])
    # end

    # def decode_token(token)
    #     JWT.decode(token, ENV["JWT_TOKEN"])[0]
    # end

    # def get_token
    #     request.headers['Authorization'] || request.headers["Authorization"]
    # end

#     def authorize!
#         unless current_viewer
#             render json: { errors: ['You must be logged in to do that!']}, 
#             status: :unauthorized
#         end
#     end




#     private
    
#     def record_not_found
#         render json: { errors: ['Record not found'] }, status: :not_found
#     end
# end