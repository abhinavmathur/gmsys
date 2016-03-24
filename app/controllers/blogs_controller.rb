class BlogsController < ApplicationController

  def index
    @blogs = Blog.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    begin
      @blog = Blog.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = 'The record you were looking for could not be found'
      redirect_to root_path
    end
  end
end
