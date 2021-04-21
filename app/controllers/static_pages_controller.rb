class StaticPagesController < ApplicationController

  def home
  end

  def explore
    @video = Video.find_by(name: params[:name])
    if @video.blank?
      flash.now[:novideo] = "Sorry, the video does not exist!"
    elsif 
      @display_src = @video.file
    end 

  end

  def about
  end

  def behind_the_scene
  end

end
