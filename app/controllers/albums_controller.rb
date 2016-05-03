class AlbumsController < ApplicationController
  def index
    @albums = Album.order(title: :asc)
  end

  def show
    @album = Album.find(params[:id])
  end

  def by_artist
    @albums = Album.where(artist: params[:artist]).order(artist: :asc)
    # raise
    render :index
  end

  def new
    @artists = Artist.select(:id, :name).order(:name)
    @album = Album.new  # create an empty shell of a model, rails will know its empty
  end

  def create
    @album = Album.new(album_create_params[:album])
    if @album.save  # save returns true (if save is successful) or false
      redirect_to album_path(@album.id)
    else
      @artists = Artist.select(:id, :name).order(:name)
      render :new
    end
  end

  private

  # you have to tell rails which params are permitted to be used in Active Record (web security issue)
  def album_create_params
    params.permit(album: [:artist, :title, :label_code]) # artist and title are in album, which is in params
  end
end
