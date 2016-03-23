class Admin::BlogsController < Admin::ApplicationController

  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.order('created_at DESC')
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    @blog.author == current_user
    if @blog.save
      flash[:success] = 'Blog post was successfully created !'
      redirect_to blog_path(@blog)
    else
      flash[:danger] = 'Blog post was not created'
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @blog.update(blog_params)
      flash[:success] = 'Blog post was successfully updated !'
      redirect_to blog_path(@blog)
    else
      flash.now[:danger] = 'Blog was not updated'
      render :edit
    end
  end

  def destroy
    @blog.destroy
    flash[:success] = 'Blog was successfully deleted.'
    redirect_to root_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :publish, :featured)
  end

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end
end