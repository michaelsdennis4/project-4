class ItemsController < ApplicationController

  require 'json'

	def index
    if (params[:category_id])
      @category = Category.find(params[:category_id])
      @items = @category.items.where({is_available: true})
    elsif (params[:keyword_ids])
      @keywords = []
      @items = []
      params[:keyword_ids].each do |key_id|
        keyword = Keyword.find(key_id)
        @keywords.push(keyword)
        keyword.items.where({is_available: true}).each do |item|
          if (!@items.include?(item))
            @items.push(item)
          end
        end
      end
    elsif (params[:code])
      @items = Item.where({code: params[:code]})
    else
      @items = Item.where({is_available: true})
    end
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
    @item = Item.find(params[:id]) 
    @item[:code] = params[:item][:code]
    @item[:caption] = params[:item][:caption]
    @item[:description] = params[:item][:description]
    @item[:selling_price] = params[:item][:selling_price].to_i
    @item[:purchase_price] = params[:item][:purchase_price].to_i
    @item[:is_available] = params[:item][:is_available]
    @item[:condition] = params[:item][:condition]
    @item[:measurements] = params[:item][:measurements]
    @item[:date_acquired] = params[:item][:date_acquired]
    @item[:date_sold] = params[:item][:date_sold]
    @item.save
    render json: @item.to_json 
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

  def set_thumb
    @item = Item.find(params[:id])
    @item[:thumb_image_id] = params[:image_id]
    @item.save
    render json: @image_to_json
  end

  def destroy
    item = Item.find(params[:id])
    item.images.each do |image|
      image.destroy
    end
    item.categories.each do |category|
      item.categories.delete(category)
    end
    item.keywords.each do |keyword|
      item.keywords.delete(keyword)
    end
    item.destroy
    redirect_to "/items"
  end 

  private

  def item_params
    params.require(:item).permit(:code, :caption, :description, :selling_price, :purchase_price, :is_available, :condition, :measurements, :date_acquired, :date_sold)
  end

end
