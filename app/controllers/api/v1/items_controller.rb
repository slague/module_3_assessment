class Api::V1::ItemsController < ApplicationController
## you can also do it by adding `skip_before_action :verify_authenticity_token` in your api controller

  def index
   render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end


  def delete

  end

end
