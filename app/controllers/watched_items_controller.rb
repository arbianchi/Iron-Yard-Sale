class WatchedItemsController < ApplicationController
  def index
    @watched_items = WatchedItem.all
  end

  def new
    @watched_item = WatchedItem.new
  end

  def create
    @watched_item = WatchedItem.new (approved_params)
    if @watched_item.save
      flash[:notice] = "Item is being watched!"
      redirect_to watched_path
    else
      render :new
    end
  end

  def show
    @watchlist = Watchlist.find(user_id: current_user)
  end
  private
  def approved_params
    params.require(:watchlist).permit(:item_id,:price_in_cents,:user_id)
  end
end
