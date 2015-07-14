class ImagesController < ApplicationController

	def index
		@item = Item.find(params[:item_id])
    @images = @item.image.all
  end

  def new
   	# @item = Item.find(params[:item_id])
    # @image = item.image.new
    @image = Image.new # temporary
  end

  def create
  	item = Item.find(params[:item_id])
    image = item.image.new
    if image.update(image_params)
      redirect_to "/items/#{item.id}/images/#{image.id}"
    else
      redirect_to '/items/#{item.id}/images/new'
    end
  end

  def show
  	@item = Item.find(params[:item_id])
    @image = @item.image.find(params[:id])
  end

  def update
    item = Item.find(params[:item_id])  
    image = item.image.find(params[:id])  
    if image.update(image_params)
    	redirect_to "/items/#{item.id}/images/#{image.id}" 
    else
    	redirect_to "/items/#{item.id}/images/#{image.id}/edit" 
    end
  end

  def edit
    @item = Item.find(params[:item_id]) 
    @image = @item.image.find(params[:id])
  end

  private

  def item_params
    params.require(:image).permit(:image_url, :caption)
  end

end