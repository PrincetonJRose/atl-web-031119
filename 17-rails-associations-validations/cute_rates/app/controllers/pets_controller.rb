class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render :index
  end

  def show
    @pet = Pet.find(params[:id])
    render :show
  end

  def new
    @pet = Pet.new
    @people = Person.all
    render :new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    render :edit
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet.id)
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image, :likes, :person_id)
  end
end
