class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def current_viewer
        auth_token = request.headers['auth-token']
        if auth_token
            token = JWT.decode( auth_token, ENV['JWT_TOKEN'])[0]
            return Viewer.find_by( id: token['viewer'])
        else
            return nil
        end
    end

    def authorize!
        unless current_viewer
            render json: { errors: ['You must be logged in to do that!']}, 
            status: :unauthorized
        end
    end

    def fetch_art
        params = 'title'
        # params = "title,artist_display,main_reference_number,date_start,date_end,date_display,place_of_origin,dimensions,medium_display,inscriptions,credit_line,publication_history,is_on_view,gallery_title,image_id"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{params}&limit=10"))
        render json: response, status: :ok
    end
    
    def search
        url = "https://api.artic.edu/api/v1/artworks/search?q=#{params[:searchTerm]}"
        response = JSON.parse( RestClient.get("https://api.artic.edu/api/"))
        render json: response, status: :ok
    end

    def gallery
        gallery = "title,artist_display,main_reference_number,date_start,date_end,date_display"
        url = "https://api.artic.edu/api/v1/artworks/artworks?fields=#{gallery}&limit=10"
        response = JSON.parse( RestClient.get("https://api.artic.edu/api/"))
        render json: response, status: :ok
    end

    def images
        url = "https://api.artic.edu/api/v1/artworks/27992?fields=id,title,image_id"
        response = JSON.parse( RestClient.get( url ))
        render json: response, status: :ok
    end


    private
    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, 
        status: :unprocessable_entity
    end
    def record_not_found
        render json: { errors: ['Record not found'] }, status: :not_found
    end
end