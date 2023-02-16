class ReviewsController < ApplicationController
    before_action :authorize!, only: %i[create update destroy]
    
    def create
        review = Review.create!(review_params)
        review.viewer_id = current_viewer.id
        
        render json: review, status: :created
    end
    
    def show
        review = Review.find(params[:id])
        render json: review, status: :ok
    end

    def index
        render json: Review.all, status: :ok
    end
    def update
        review = Review.update!(review_params)
        render json: review, status: :updated
    end

    def destroy
    end

    private
    def review_params
        params.require(:review).permit(:art_id, :visit_id, :content, :rating, :created_at, :updated_at)
    end
end