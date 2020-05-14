class CategoriesController < ApplicationController
  def categories
  
    @categories = Category.all
	if params[:search]
    @categories = Category.search(params[:search]).order("created_at DESC")
  else
    @categories = Category.all.order("created_at DESC")
  end
	
  end
  
end