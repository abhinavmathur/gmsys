class BlogsController < ApplicationController

  def index
    @blogs = Blog.order('created_at DESC')
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end
end
