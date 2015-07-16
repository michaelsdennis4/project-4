class ItemsController < ApplicationController

  require 'json'

	def index
    @items = Item.all
  end

   def new
    @item = Item.new
    @categories = Category.all.order(:name)
    @keywords = Keyword.all.order(:phrase)
  end

  def create
    item = Item.new
    if item.update(item_params)
      redirect_to "/items/#{item.id}/edit"
    else
      redirect_to '/items/new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])   
    if item.update(item_params)
    	redirect_to "/items/#{item.id}" 
    else
    	redirect_to "/items/#{item.id}/edit"
    end
  end

  def edit
    @item = Item.find(params[:id]) 
    @categories = Category.all.order(:name)
    @keywords = Keyword.all.order(:phrase)
  end

  def toggle_cat
    @item = Item.find(params[:id]) 
    category = Category.find(params[:category_id])
    if (@item.categories.include?(category))
      @item.categories.delete(category)
    else
      @item.categories.append(category)
    end
    render json: @item.to_json
  end

  def toggle_key
    @item = Item.find(params[:id]) 
    keyword = Keyword.find(params[:keyword_id])
    if (@item.keywords.include?(keyword))
      @item.keywords.delete(keyword)
    else
      @item.keywords.append(keyword)
    end
    render json: @item.to_json
  end

  private

  def item_params
    params.require(:item).permit(:code, :caption, :description, :selling_price, :purchase_price, :is_available, :condition, :measurements, :date_acquired, :date_sold)
  end

end
