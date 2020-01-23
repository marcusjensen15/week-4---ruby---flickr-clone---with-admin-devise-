class StaticController < ApplicationController
  def show
    @images = Image.all
    render :home
  end
end
