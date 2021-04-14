class StaticPagesController < ApplicationController

  def home
  end

  def explore
    @video = Video.find_by(name: params[:name])
    if @video.nil?
      flash.now[:novideo] = "Sorry, the video does not exist!"
    elsif 
      @display = @video 
    end 

  end

  def about
  end

  def behind_the_scene
  end

end
