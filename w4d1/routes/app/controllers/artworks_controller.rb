class ArtworksController < ApplicationController

    def index
      @user = User.find(params[:artist_id])
      @artworks = @user.artworks
      if @artworks && @user.shared_artworks
        render json: [@artworks, @user.shared_artworks]
      else
        render json: @user.errors.full_messages, status: 422
      end
    end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])
    if @artwork.update_attributes(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end


  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update_attributes(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render json: @artworks.errors.full_messages, status: 404
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def has_artist_id
    params[:artwork][:artist_id]
  end
end
