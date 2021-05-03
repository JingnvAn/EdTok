class StaticPagesController < ApplicationController

  def home
  end

  def explore
    if params[:name]
      @videos = Video.where(name: params[:name])
        if @videos.blank?
          flash.now[:novideo] = "Sorry, the video does not exist!"
        elsif 
          ##@display_src = @video
          @videos
        end   
    elsif params[:subject]
      @videos = Video.where(subject: params[:subject])
        if @videos.blank?
          flash.now[:novideo] = "Sorry, no video in this subject!"
        elsif 
          ##@display_src = @video
          @videos
        end   
    else
      @videoNum = Video.count
      if @videoNum != 0
        @videos = Video.all
      else
        flash.now[:novideo] = "Sorry, there is no video!"
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
