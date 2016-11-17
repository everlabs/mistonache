class NoveltiesController < ApplicationController
  def show
    @novelty = Novelty.find(params[:id])
  end
end
