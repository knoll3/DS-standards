class FramingsController < ApplicationController
  require 'framings_helper'

  def show
    @framings = Framing.all
    @framing  = params[:id] ? Framing.find(params[:id]) : Framing.find(1)
    @images   = @framing.images.all
    if params[:active_url]
      @active_url = remove_quotes params[:active_url]
    else
      @active_url = "coserv_va1.jpg"
    end
    respond_to do |f|
      f.html
      f.js
    end
  end
  
  private
  
    def framing_params
      params.require(:framing).permit(:desc, :coserv, :oncor, :tnmp, :trinity_valley)
    end
    
    def remove_quotes str
      str.gsub(/\"/,'')
    end
end
