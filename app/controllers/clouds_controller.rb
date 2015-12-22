class CloudsController < ApplicationController

  def index
    @clouds = Cloud.all
  end

  def show
    @cloud = Cloud.find(params[:id])
  end

  def new
    @cloud = Cloud.new({})
  end

  def create
    @cloud = Cloud.new({"name" => params[:name], "units" => params[:units], "precipitation" => params[:precipitation], "composition" => params[:composition], "min" => params[:min_altitude], "max" => params[:max_altitude]})
    @cloud.create
    redirect_to "/clouds/#{@cloud.id}"
  end

  def edit
    @cloud = Cloud.find(params[:id])
  end

  def update
    @cloud = Cloud.find(params[:id])
    @cloud.update({"name" => params[:name], "units" => params[:units], "precipitation" => params[:precipitation], "composition" => params[:composition], "min" => params[:min_altitude], "max" => params[:max_altitude]})
    redirect_to "/clouds/#{@cloud.id}"
  end

  def destroy
    Cloud.find(params[:id]).destroy
    redirect_to "/clouds"
  end
end
