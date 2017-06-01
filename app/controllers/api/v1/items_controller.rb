class Api::V1::ItemsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
   render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.create(item_params)
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: Item.all
  end


  def item_params
    params.permit(:name, :description, :image_url)
  end

end
