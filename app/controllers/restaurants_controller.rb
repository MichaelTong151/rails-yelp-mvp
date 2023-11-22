class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :address, :phone_number, :category))
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
     @restaurant = Restaurant.find(params[:id])
     if @restaurant.update(restaurant_params)
       render json: @restaurant
     else
       render json: @restaurant.errors, status: :unprocessable_entity
     end

      def destroy
      restaurant = Restaurant.find(params[:id])
      restaurant.destroy
      redirect_to restaurants_path, status: :see_other
      end

  private

  def restaurant_params
     params.require(:restaurant).permit(:name, :address, :rating)
  end
end
end
