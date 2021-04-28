class StaticPagesController < ApplicationController

  def home
  end

  def explore
    if params[:name].nil?
      @videoNum = Video.count
      if @videoNum != 0
        @videos = Video.all
      else
        flash.now[:novideo] = "Sorry, there is no video!"
      end
      
    else
        @videoNum = 0
        @video = Video.find_by(name: params[:name])
      if @video.blank?
        flash.now[:novideo] = "Sorry, the video does not exist!"
      elsif 
        @display_src = @video
      end   
    end
    

  end

  def about
  end

  def behind_the_scene
  end

  def science
    @selected = Video.where(subject: 'science')
  end 

  def others
    @selected = Video.where(subject: 'others')
  end 

  def comic
    @selected = Video.where(subject: 'comic')
  end 

end
