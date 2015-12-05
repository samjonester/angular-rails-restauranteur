class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants.json
  def index
    if params.has_key?(:count)
      render text: Restaurant.count
    else
      @restaurants = Restaurant.all
    end
  end

  # GET /restaurants/1.json
  def show
  end

  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      begin
        @restaurant = Restaurant.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        respond_to {|format| format.json { render json: {error: 'Restaurant not found'}, status: :not_found } }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
