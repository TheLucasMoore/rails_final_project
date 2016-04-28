class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      raise params.inspect
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
  end

  def edit
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :recipe_id)
  end
end
