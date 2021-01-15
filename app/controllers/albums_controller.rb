class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end
  
  def new
    @album = Album.new # our new route first instantiates a new Album -- but it does not save -- that's what create will do
    render :new
  end
  
  def create
    @album = Album.new(album_params)
    if @album.save # remember that returns a boolean 
      redirect_to albums_path
    else
      render :new
    end    
  end
  
  def edit
    @album = Album.find(params[:id])
    render :edit
  end
  
  def show
    @album = Album.find(params[:id])
    render :show
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render :edit
    end    
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private #any methods included under private will only be available inside the AlbumsController class.
    def album_params
      params.require(:album).permit(:name, :genre) #permit takes the names of parameters to accept from user
    end  

end    