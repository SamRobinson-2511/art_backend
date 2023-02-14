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
end


