class VisitsController < ApplicationController
    def show 
        
    end

    def index 
        render json: Visit.all, status: :ok
    end

    def create
        visit = Visit.create!(visit_params)
        render json: visit, status: :created
    end

    def destroy
        visit = Visit.destroy
        content :no_head
    end


    private
    def visit_params
        params.require(:visit).permit(:viewer_id, :art_id, :date, :review_id, :rating)
    end


end
