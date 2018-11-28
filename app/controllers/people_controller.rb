class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :edit]

  def index
    @people = Person.all
  end

  def show
    #Person.find()
    #SELECT * PERSON WHERE ID 
    # renders the show page in the view
  end

  def new
    @person = Person.new
    render partial: "form"
  end

  # post to create in the db
  def create
    @person = Person.create(person_params)
    if @person.save
      redirect_to @person
    else
      render :new
    end
  end

  def edit
    # render the edit form
    render partial: "form"
  end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      render :edit
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to root_path
  end

  private
    def person_params
      params.require(:person).permit(:name, :hair_color, :eye_color, :gender, :alive, :age)
    end

    def set_person
      @person = Person.find(params[:id])
    end

end