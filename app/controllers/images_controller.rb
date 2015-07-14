class ImagesController < ApplicationController

	def index
		@item = Item.find(params[:item_id])
    @images = @item.images.all
  end

  def new
   	@item = Item.find(params[:item_id])
    @image = @item.images.new
  end

  def create
  	item = Item.find(params[:item_id])
    image = item.images.new
    if image.update(image_params)
      redirect_to "/items/#{item.id}/images/#{image.id}"
    else
      redirect_to '/items/#{item.id}/images/new'
    end
  end

  def show
  	@item = Item.find(params[:item_id])
    @image = @item.images.find(params[:id])
  end

  def update
    item = Item.find(params[:item_id])  
    image = item.images.find(params[:id])
    if image.update(image_params)
    	redirect_to "/items/#{item.id}/images/#{image.id}" 
    else
    	redirect_to "/items/#{item.id}/images/#{image.id}/edit" 
    end
  end

  def edit
    @item = Item.find(params[:item_id]) 
    @image = @item.images.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:image_uid, :caption, :image)
  end

end