class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @organizations = @category.organizations.order("name")
  end
end