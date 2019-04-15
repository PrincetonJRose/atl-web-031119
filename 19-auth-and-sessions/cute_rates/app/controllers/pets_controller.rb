class PetsController < ApplicationController
  before_action :authorize!, except: [:index, :show]

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
    @pet = current_user.pets.build(pet_params)
    # @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      @people = Person.all
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

  def destroy
    if current_user && pet.person_id == current_user.id
      @pet = Pet.find(params[:id])
      @pet.destroy
    else
      flash[:error] = "You don't have permission to do that."
    end
    redirect_to pets_path
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image, :likes)
  end
end
