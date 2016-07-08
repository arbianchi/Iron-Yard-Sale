class InventoriesController < ApplicationController

  def upload
    hashes = SmarterCSV.process(params[:file].tempfile)
    hashes.each do |record|
      item = Item.find_by(id: record[:id])
      quantity = record.delete(:quantity)
      if value = record.delete(:price)
        record[:price_in_cents] = ValueConverter.price_to_cents(value)
      end

      if item
        item = Item.update(record)
      else
        item = Item.create(record)
      end
      item.save
      Inventory.create!(
        store_id:   params[:id],
        item_id:    item.id,
        quantity:   quantity
      )
    end
    redirect_back :back
  end
end
