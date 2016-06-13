class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json:@ingredients}
    end
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
    respond_to do |format|
      format.html {render :show}
      format.json {render json:@ingredient}
    end
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
      flash[:alert] = @ingredient.errors.full_messages
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
