class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
  end

  def create
    @album = Album.new(album_params)
    @album.save
    redirect_to albums_path
  end

  private
  # require isn't needed unless your params are _nested_
  # If the structure is flat, you should just use permit.
  def album_params
    # params.require(:album).permit(:title, :artist)
    params.permit(:title, :artist, :year, :rating)
  end

end
