class CampersController < ApplicationController

    
    
    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])

        if camper.valid?
            render json: camper, status: :ok
        else
            render json: { error: "Camper not found"}, status: 404
        end
    end

    def create
        newCamper = Camper.create(camper_params)

        if newCamper.valid?
            render json: newCamper, status: :created_at

        else
            render json: { errors: ["validation errors"]}, status: :unprocesssable_entity
    end


    private

    def camper_params

        params.permit(:name, :age)
    end


end
