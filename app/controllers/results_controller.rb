class ResultsController < ApplicationController
  def index
    @categories = Category.all
    @search_results = Product.search_everywhere(params[:query])
  end
end
