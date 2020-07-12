class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    building = Building.find(params[:id])
    @building_facade = BuildingsFacade.new(building)
  end
end
