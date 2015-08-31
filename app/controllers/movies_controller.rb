class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  layout 'application'
  after_filter "save_my_previous_url", only: [:new, :edit, :show]

  # GET /movies
  # GET /movies.json
  def index
    # @user = User.find(params[:user_id])
    @movies = User.find(params[:user_id]).movies.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @back_url = session[:my_previous_url]
  end

  # GET /movies/new
  def new
    @user = User.find(params[:user_id])
    @movie = User.find(params[:user_id]).movies.build
    @back_url = session[:my_previous_url]
  end

  # GET /movies/1/edit
  def edit
    @back_url = session[:my_previous_url]
  end

  # POST /movies
  # POST /movies.json
  def create
    @user = User.find(params[:user_id])
    @movie = @user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to :acion => 'show', :id => @movie.id, :user_id => @user.id, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to :acion => 'show', :id => @movie.id, :user_id => @user.id, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to :action => 'index', :user_id => @user.id, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = User.find(params[:user_id]).movies.find(params[:id])
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :format, :length_hour, :length_min, :release_year, :rating)
    end

    def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end
end
