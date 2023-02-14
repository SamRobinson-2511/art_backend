class GalleriesController < ApplicationController
    def index 
        render json: Gallery.all, status: :ok
    end

    def create
        gallery = Gallery.create!(gallery_params)
        render json: gallery, status: :created
    end

    def update
        gallery = Gallery.update!(gallery_params)
        render json: gallery, status: :updated
    end

    def destroy
        gallery = Gallery.destroy(params[:id])
        gallery.destroy
        head :no_content 
    end

    private
    def gallery_params
        params.require(:gallery).permit(:gallery, :viewer_id)
    end


end
