class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    @person.pets.build
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :location,
      pets_attributes: [:name, :image, :likes])
  end
end
