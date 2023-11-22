class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
end

#GET /restaurants
#GET /restaurants.json
def index
  @restaurants = Restaurant.all
end

#GET /restaurants/1
#GET /restaurants/1.json
def show
  @restaurant = Restaurant.find params[:id]
  @reviews = @restaurant.reviews # <--------- added
end

#GET /restaurants/new
def new
  @restaurants = Restaurant.new
end

#Get /restaurants/1/edit
def edit
end

#POST /restaurants
#POST /restaurants.json
def create
  @restaurants = Restaurant.new(restaurant_params)

  respond_to do |format|
  if @restaurants.save
  format.html { redirect_to @restaurants, notice: 'Restaurant was successfully created.' }
  format.json { render :show, status: :created, location: @restaurant }
else
  format.html { render :new }
  format.json { render json: @restaurants.errors, status: :unprocessable_entity }
end
end
end

#PATCH/PUT /restaurants/1
#PATCH/PUT /restaurants/1.json
def update
  respond_to do |format|
    if @restaurants.update(restaurant_params)
      format.html { redirect_to @restaurants, notice: 'Restaurant was successfully updated.' }
      format.json { render json: @restaurant.errors, status: unprocessable_entity }
    end
  end
end

#DELETE /restaurants/1
#DELETE /restaurants/1.json
def destroy
  @restaurants.destroy
  respond_to do |format|
    format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
#Use callbacks to share common Setup or constraints between actions
def set restaurant
  @restaurant = Restaurant.find(params[:id])
end

#Never trust parameters from the scary internet, only allow the white list through.
def restaurant_params
  params.require(:restaurant).permit(:name, :address, :phone_number, :category)
end
