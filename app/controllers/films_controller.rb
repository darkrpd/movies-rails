class FilmsController < ApplicationController
  load_and_authorize_resource
  #skip_authorization_check :only => [:like, :dislike]

  before_action :set_film, only: [:show, :edit, :update, :destroy]
  # before_action :set_cast, only: [:show, :edit, :update, :destroy]
  # GET /films
  # GET /films.json
  def index
    @films = Film.all
  end

  # GET /films/1
  # GET /films/1.json
  def show
    # @casts=Cast.all
  end

  # GET /films/new
  def new
    @film = Film.new
   @casts = Cast.all
  end

  # GET /films/1/edit
  def edit
    @casts = Cast.all
  end

  # POST /films
  # POST /films.json
  def create
    # @film = Film.new(film_params)
     @film = Film.create(film_params)

    params[:actor_ids].each do |cast_id|
      FilmActor.create(film_id: @film.id, cast_id: cast_id)
    end

    params[:director_ids].each do |cast_id|
      FilmDirector.create(film_id: @film.id, cast_id: cast_id)
    end

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update

      @film.actors.destroy_all
      @film.directors.destroy_all

      params[:actor_ids].each do |cast_id|
        FilmActor.create(film_id: @film.id, cast_id: cast_id)
      end

      params[:director_ids].each do |cast_id|
        FilmDirector.create(film_id: @film.id, cast_id: cast_id)
      end




    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def like
    @user=current_user
    @film= Film.find(params[:id])
    @film.upvote_by @user
    redirect_to films_path

  end

  def dislike
    @user=current_user
    @film= Film.find(params[:id])
    @film.downvote_by @user
    redirect_to links_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end
    #
    # def set_cast
    #   @cast = Cast.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.require(:film).permit(:id, :name, :details )
    end
end
