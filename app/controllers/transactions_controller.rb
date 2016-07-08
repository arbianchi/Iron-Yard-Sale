class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    @items = Item.all
    # authorize @transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(store_id: params[:store_id], item_id: params[:item_id], price_in_cents: params[:price_in_cents], quantity_purchased: params[:quantity_purchased], buyer_id: params[:buyer_id] )

    respond_to do |format|
      if @transaction.save && update_inventory
        format.html { redirect_to transactions_path, notice: 'Item added to shopping cart!' }
        format.json { render :show, status: :created, location: @transaction }

      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_inventory
    i = Inventory.find(@transaction.item_id)
    q = i.quantity
    p = @transaction.quantity_purchased
    if q > p 
     i.update(quantity:(q -= p))
    else
      raise "There is not enough of that item left!"
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:item_id, :store_id, :buyer_id, :quantity_purchased, :price_in_cents)
  end

end
