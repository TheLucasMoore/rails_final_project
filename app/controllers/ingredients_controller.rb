class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredients_path
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else 
      render 'edit'
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
    @ingredient.destroy

    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :name)
  end
end
