class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])  	
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
      flash[:success] = "Bem vindo/a a Recibos Online"
    else
      render 'new'
    end
  end

  def search
  end
end
