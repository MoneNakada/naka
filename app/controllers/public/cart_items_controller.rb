class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  
  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # 追加した商品がカート内に存在するかの判別
    if @cart_item.present?
      # 存在していた場合…
      # 元々カートに登録されてる数量+フォームで選択した数量
      @cart_item.amount += cart_item_params[:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
      redirect_to cart_items_path
    else
      # 存在しなかった場合…
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      if @cart_item.save
        redirect_to cart_items_path
      else
        render 'public/items/show'
      end
    end
  end
  
  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
