class ItemsController < ApplicationController

	def index
    @items = Item.all
  end

   def new
    @item = Item.new
  end

  def create
    item = Item.new
    if item.update(item_params)
      redirect_to "/items/#{item.id}"
    else
      redirect_to '/items/new'
    end
  end

  def show
    @item = item.find(params[:id])
  end

  def update
    item = item.find(params[:id])   
    if item.update(item_params)
    	redirect_to "/items/#{item.id}" 
    else
    	redirect_to "/items/#{item.id}/edit"
    end
  end

  def edit
    @item = item.find(params[:id]) 
  end

  private

  def item_params
    params.require(:item).permit(:code, :caption, :description, :selling_price, :purchase_price, :is_available, :condition, :measurements, :date_acquired, :date_sold)
  end

end
