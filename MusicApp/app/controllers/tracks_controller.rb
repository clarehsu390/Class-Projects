class TracksController < ApplicationController

  def new
    @track = Track.new
  end

  def create
    track = Track.create(track_params)
    if track.save
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def track_params
    params.require(:track).permits(:title, :album_id)
  end
end
