class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.where(is_active: 'true')
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_items = @genre.items.where(is_active: 'true')
    else
      all_items = Item.where(is_active: 'true')
    end
    # @items = all_items.all
    @items = all_items.page(params[:page]).per(8)
    @all_items_count = all_items.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    if params[:name].present?
      @items = Item.where('name like ?', "%#{params[:name]}%")
    else
      @items = Item.all
    end
  end
end
