class StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @items = Item.all
    @watched_items = WatchedItem.all
    @watched_item = WatchedItem.new
    @inventory = Inventory.all
  end

  def new
    @store = Store.new
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :description, :admin_id)
  end


end
