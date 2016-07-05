class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer     :name,              null: false
      t.text        :description,       null: false
      t.integer     :price_in_cents,    null: false
      t.integer     :store_id,           null: false

      t.timestamps
    end

    create_table :inventory do |t|
      t.integer     :store_id,      null: false
      t.integer     :item_id,       null: false
      t.integer     :quantity,      null: false

      t.timestamps
    end

    create_table :transactions do |t|
      t.integer     :store_id,  null: false
      t.integer     :item_id,   null: false
      t.integer     :price_in_cents,     null: false
      t.integer     :quantity_purchased, null: false
      t.integer     :buyer_id,  null: false

      t.timestamps
    end

    create_table :store_admins do |t|
      t.integer     :store_id,  null: false
      t.integer     :user_id,   null: false
    end

    create_table :watched_items do |t|
      t.integer     :item_id,   null: false
      t.integer     :user_id,   null: false
      t.integer     :price_in_cents, null: false
    end

    create_table :stores do |t|
      t.string      :name,          null: false
      t.text        :description,   null: false
    end

    add_column :users, :admin,  :boolean

  end
end
