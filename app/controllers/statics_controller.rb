class StaticsController < ApplicationController
  def index
  end

  def about
    @users = User.where(advisory: true)
  end
end
