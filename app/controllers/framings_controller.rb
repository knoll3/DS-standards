class FramingsController < ApplicationController
  require 'framings_helper'
  
  def index
    @framings = Framing.all
    @images = Framing.first.images.all
  end

  def show
    @framings = Framing.all
    @framing  = params[:id] ? Framing.find(params[:id]) : Framing.find(1)
    @images   = @framing.images.all
    if params[:data_value]
      @active_url = remove_quotes params[:data_value]
    else
      @active_url = "coserv_va1.jpg"
    end

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
    
    def remove_quotes str
      str.gsub(/\"/,'')
    end
end
