class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_items = @genre.items
    else
      all_items = Item.all
    end
    @items = all_items.all
    @all_items_count = all_items.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
