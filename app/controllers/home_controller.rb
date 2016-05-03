class HomeController < ApplicationController
  def index
    # @name = "Lisa"
    @name = params[:name] || "Lisa"
  end

  def rosa
    @best_dog = "zomg yass"
  end
end
