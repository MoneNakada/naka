class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_active: true).order(id: "DESC").limit(3)
  end

  def about
  end
end
