class ShopsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]

  def new
  	@shop = Shop.new
  end

  def show
  	@shop = Shop.find(params[:id])
  end

  def create
  	@shop = Shop.new(params[:shop])
  	if @shop.save
  		flash[:success] = "Nova loja introduzida"
  		redirect_to @shop
  	else
  		render 'new'
  	end
  end

  def edit
  	@shop = Shop.find(params[:id])  	
  end

  def update
  	@shop =Shop.find(params[:id])
  	if @shop.update_attributes(params[:shop])
  		flash[:success] = "Profile updated"
      	redirect_to @shop
  	else
  		render 'edit'
  	end
  end

  def search
  	@shop = Shop.find(params[:id])
  	flash[:success] = "Profile updated"
    redirect_to @shop
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end


