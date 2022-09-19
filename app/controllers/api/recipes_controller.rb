class Api::RecipesController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter
  before_action :doorkeeper_authorize!, only: %w[index show update destroy]
  before_action :current_user_authenticate, only: %w[index show update destroy]
  before_action :recipe, only: %w[show update destroy]

  # jitera-anchor-dont-touch: actions
  def destroy
    @error_message = true unless @recipe&.destroy
  end

  def update
    @error_object = @recipe.errors.messages unless @recipe.update(recipe_params)
  end
  
  def show
    @error_message = true if @recipe.blank?
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    
    @error_object = @recipe.errors.messages unless @recipe.save
  end
  
  def index
    @recipes = Recipe.ransack(params[:query]).result
  end
  
  private
  
  # Using find so that record not found exception is generated and we will catch that in base controller and handle it there.
  def recipe
    @recipe ||= Recipe.find(id: params[:id] || params[:recipe_id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :title, :descriptions, :time, :difficulty, :category_id, :user_id
    )
  end
end