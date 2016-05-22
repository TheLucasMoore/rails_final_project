class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @recipe = Recipe.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to recipe_comments_path
    else
      flash[:alert] = @comment.errors.full_messages
      render :new
    end
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
    respond_to do |format|
      format.html {render :index }
      format.json {render json:@comments }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html {render :edit }
      format.json {render json:@comment }
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    authorize @comment

    @comment.update(comment_params)
    if @comment.save
      redirect_to recipe_comments_path
    else
      flash[:alert] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy

    redirect_to recipe_comments_path
  end

  private

  def comment_params
    params.permit(:content, :user_id, :recipe_id, :id)
  end
end
