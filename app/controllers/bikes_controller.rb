# frozen_string_literal: true

class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]
  before_action :authenticate_admin_user!, except: %i[index show]
  after_action :update_bike_visiting, only: :show
  has_scope :by_name
  has_scope :by_price_lower_than
  has_scope :by_price_larger_than
  has_scope :by_style
  has_scope :order_by_visitings


  # GET /bikes or /bikes.json
  def index
    @bikes = apply_scopes(Bike.order_by_visitings).all
  end

  # GET /bikes/1 or /bikes/1.json
  def show; end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit; end

  # POST /bikes or /bikes.json
  def create
    @bike = Bike.new(bike_params)

    respond_to do |format|
      if @bike.save
        # format.html { redirect_to bike_url(@bike), notice: "Bike was successfully created." }
        format.json { render :show, status: :created, location: @bike }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bikes/1 or /bikes/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        # format.html { redirect_to bike_url(@bike), notice: "Bike was successfully updated." }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikes/1 or /bikes/1.json
  def destroy
    @bike.destroy

    respond_to do |format|
      # format.html { redirect_to bikes_url, notice: "Bike was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def update_bike_visiting
    return if session[@bike.id]
    session[@bike.id] = @bike.id
    @bike.new_visit
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_bike
    @bike = Bike.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :desc, :style_id, :price, :image)
  end
end
