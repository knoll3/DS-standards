class FramingsController < ApplicationController
  require 'framings_helper'
  
  def index
    @framings = Framing.all
    @images = Framing.first.images.all
  end

  def show
    @framings = Framing.all
    @framing  = Framing.find(params[:id]) 
    @images   = @framing.images.all
    respond_to do |f|
      f.html
      f.js
    end
  end
  
  def create
    framing = Framing.new(framing_params)
    framing.save
    redirect_to root_path
  end
  
  def destroy
    framing = Framing.find(params[:id])
    framing.destroy!
    redirect_to root_path
  end
  
  private
  
    def framing_params
      params.require(:framing).permit(:desc, :coserv, :oncor, :tnmp, :trinity_valley)
    end
end
