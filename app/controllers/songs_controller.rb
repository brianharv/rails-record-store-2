class SongsController < ApplicationController
  
  def new
    @album = Album.find(params[:album_id]) # remember we are using album_id because that is a songs property and serving as our foreign key
    @song = @album.songs.new
    render :new
  end
  
  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.new(songs_params)
    if @song.save
      redirect_to :album_path(@album)
    else
      render :new
    end  
  end
  
  def edit
    @song = Song.find(params[:id])
    render :edit
  end
  
  def show
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    render :show
  end
  
  def update
    @song = Song.find(params[:id])
    if @Song.update(song_params)
      redirect_to songs_path
    else
      render :edit
    end    
  end
  
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to albums_path
  end

  private
    def song_params
      params.require(:song).permit(:name, :lyrics) #permit takes the names of parameters to accept from user
    end  

end    