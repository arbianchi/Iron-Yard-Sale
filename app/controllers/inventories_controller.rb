class InventoriesController < ApplicationController

  def upload
    hashes = SmarterCSV.process(params[:file].tempfile)
    hashes.each do |record|
      item = Item.create!(
        name:           record[:name],
        description:    record[:description],
        price_in_cents: ValueConverter.price_to_cents(record[:price]),
        store_id:       params[:id]
      )
      Inventory.create!(
        store_id:   params[:id],
        item_id:    item.id,
        quantity:   record[:quantity]
      )
    end
  end

end
