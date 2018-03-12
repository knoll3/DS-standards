class FramingController < ApplicationController
  require 'framing_helper'
  
  def index
    @framings = Framing.all
  end

  def show
  end
end
