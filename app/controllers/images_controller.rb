class ImagesController < ApplicationController

  require 'json'

	def index
		@item = Item.find(params[:item_id])
    @images = @item.images.all.order(:id);
  end

  def new
   	@item = Item.find(params[:item_id])
    @image = @item.images.new
  end

  def create
  	item = Item.find(params[:item_id])
    image = item.images.new
    if image.update(image_params)
      redirect_to "/items/#{item.id}/images"
    else
      redirect_to '/items/#{item.id}/images/new'
    end
  end

  def update #caption only
    item = Item.find(params[:item_id])
    @image = item.images.find(params[:id])
    @image[:caption] = params[:caption]
    @image.save
    render json: @image.to_json
  end

  def destroy
    item = Item.find(params[:item_id]) 
    @image = item.images.find(params[:id])
    @image.destroy
    render json: @image.to_json
  end

  private

  def image_params
    params.require(:image).permit(:image_uid, :caption, :image)
  end

end