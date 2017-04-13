# Categories controller class
class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  # GET /categories
  # Gets a list of all categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  # Gets a single category
  def show
    render json: @category
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end
end
