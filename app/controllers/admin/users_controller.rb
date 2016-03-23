class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'User has been successfully created'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'User was not created'
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User has been successfully updated'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'User was not updated'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User was successfully deleted'
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :work_title, :description,
                                 :advisory, :admin, :facebook, :twitter, :linkedin, :password,
    :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
