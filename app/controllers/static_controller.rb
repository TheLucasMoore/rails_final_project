class StaticController < ApplicationController
  def index
  end

  def about
    unless current_user
      redirect_to root_path
    end
  end
end
