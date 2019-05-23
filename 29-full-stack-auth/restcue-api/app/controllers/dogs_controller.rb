class DogsController < ApplicationController
  before_action :authorize!, only: [:create]
  
  def index
    @dogs = Dog.all
    render json: @dogs, status: :ok
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      render json: @dog, status: :created
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def dog_params
    params.permit(:name, :image_url, :likes, :adopted)
  end
end
