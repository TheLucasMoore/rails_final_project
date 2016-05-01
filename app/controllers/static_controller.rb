class StaticController < ApplicationController
  def index
    unless current_user
      redirect_to about_path
    end
  end

  def about
  end
end
