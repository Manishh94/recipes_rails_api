class Api::RatingsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter
    before_action :doorkeeper_authorize!, only: %w[index show update destroy]
    before_action :current_user_authenticate, only: %w[index show update destroy]
    before_action :set_recipe, only: %w(create)

    def create
      @rating = @recipe.ratings.build(rating_params)
      @rating.user = current_user
      @error_object = @rating.errors.messages unless @rating.save
    end
  
    private

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def rating_params
      params.require(:rating).permit(
        :rate, :comment
      )
    end
  end
  