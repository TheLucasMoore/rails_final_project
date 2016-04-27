class CommentsController < ApplicationController

  def new
    if params[:recipe_id]
      raise params.inspect
    else
    @comment = Comment.new
  end
  end

  def create
    raise params.inspect
    @comment = Comment.create(comment_params)

    if @recipe = params[:recipe_id]
      redirect_to recipe_path(@recipe)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
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
