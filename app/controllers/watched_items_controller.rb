class WatchedItemsController < ApplicationController
  def index
    @watched_items = WatchedItem.all
  end

  def new
    @watched_item = WatchedItem.new
  end

  def create
    @watched_item = WatchedItem.new(item_id: params["watched_item"][:item_id], user_id: params["watched_item"][:buyer_id], price_in_cents: (params["watched_item"][:price_in_cents].to_i * 100))
    if @watched_item.save
      flash[:notice] = "Item is being watched!"
      redirect_to :back 
    else
      render :new
    end
  end

end
