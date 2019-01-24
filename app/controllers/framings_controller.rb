class FramingsController < ApplicationController
  require 'framings_helper'

  def show
    @framings = Framing.all
    if params[:id]
      @framing = Framing.find(params[:id])
    else
      @framing = Framing.find(1)
    end
    @images = []
    @framing.images.each do |image|
      visible_companies = Company.where(visible: true).map {|company| company.name}
      if visible_companies.include?(get_raw_name_from image.url) 
        @images << image
      end
    end
    
    if @images != []
      @active_url = params[:active_url] ? remove_quotes(params[:active_url]) : @images.first.url
    end

    respond_to do |f|
      f.html
      f.js
    end
    @companies = Company.all
  end

  
  private
  
    def framing_params
      params.require(:framing).permit(:desc, :coserv, :oncor, :tnmp, :trinity_valley)
    end

    def remove_quotes str
      str.gsub(/\"/,'')
    end

    def get_raw_name_from url 
      url.scan(/(.+)_/)[0][0]
    end
end
