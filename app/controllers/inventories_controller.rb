class InventoriesController < ApplicationController

  def upload
    hashes = SmarterCSV.process(params[:file].tempfile)
    hashes.each do |record|
      item = Item.find_by(id: record[:id])
      quantity = record.delete(:quantity)
      record.merge!({"store_id" => params[:id]})
      record.delete(:id)
      if value = record.delete(:price)
        record[:price_in_cents] = ValueConverter.price_to_cents(value)
      end
      if item
        item.update(record)
      else
        item = Item.create(record)
      end
      item.save

      # update inventory

      Inventory.create!(
        store_id: params[:id],
        item_id: item.id,
        quantity: quantity
      )

    end
    redirect_to :back
  end
end
