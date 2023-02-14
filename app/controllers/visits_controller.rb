class VisitsController < ApplicationController
    def show 
        render json: Visit.all, status: :ok
    end

    def index 
        visit = Visit.find(params[:id])
        render json: visit, status: :ok
    end

    def create
        visit = Visit.create!(visit_params)
        render json: status: :created
    end

    def destroy
        visit = Visit.destroy
        
    end


    private
    def visit_params
        params.require(:visit).permit(:viewer_id, :art_id, :date, :review_id)
    end


end
