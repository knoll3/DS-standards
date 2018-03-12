class FramingController < ApplicationController
  def index
    @framings = Framing.all
  end

  def show
  end
end
