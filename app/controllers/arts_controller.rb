class ArtsController < ApplicationController
    def index
        artworks = Art.all 
        render json: art, status: :ok
    end

    def explore
        offset = rand(Art.count)
        rand_records = Art.offset(offset).limit(5)
        render json: rand_records
    end

    def show
        artwork = Art.find(params[:id])
        render json: artwork
    end

    def fetch_art
        params = "id,title,artist_display,is_on_view,image_id"
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

end


