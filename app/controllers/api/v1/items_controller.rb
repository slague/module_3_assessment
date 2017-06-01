class Api::V1::ItemsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
   render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end


  def destroy
    item = Item.find(params[:id])
    item.destroy

    render json: Item.all
  end


  private

  def item_params
    params.permit(:name, :description, :image_url)
  end


end
