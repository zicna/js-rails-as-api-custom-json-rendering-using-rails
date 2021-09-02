class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: @birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    render json: bird.slice(:id, :name, :species)
    #slice returns new hash only with keys we pass 
    else
      render json: {message: "Bird not found"}
    end
  end
end