class PlantsController < ApplicationController
    # GET /birds
  def index
    plants = Plant.all
    render json: plants, except: [:created_at, :updated_at]
  end

  # GET /birds/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, except: [:created_at, :updated_at]
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
