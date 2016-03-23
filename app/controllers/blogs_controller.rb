class BlogsController < ApplicationController

  def index
    @blogs = Blog.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end
end
