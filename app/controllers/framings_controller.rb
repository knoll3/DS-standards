class FramingsController < ApplicationController
  require 'framings_helper'
  
  def index
    @framings = Framing.all
    @framing = Framing.new
  end

  def show
  end
  
  def create
    framing = Framing.new(framing_params)
    framing.save
    redirect_to root_path
  end
  
  private
  
    def framing_params
      params.require(:framing).permit(:desc, :coserv, :oncor, :tnmp, :trinity_valley)
    end
end
