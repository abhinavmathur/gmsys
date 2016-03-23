class StaticsController < ApplicationController
  def index
    @blogs = Blog.where(featured: true).order('created_at DESC').take(3)
  end

  def about
    @users = User.where(advisory: true)
  end
end
