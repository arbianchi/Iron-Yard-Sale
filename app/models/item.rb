class Item < ApplicationRecord
  belongs_to :store
  belongs_to :purchase, class_name: "Transaction", foreign_key: "transaction_id"
  belongs_to :inventory
  belongs_to :watched_item
  belongs_to :user

  def price
    "$#{(self.price_in_cents / 100)}.00"
  end

  def quantity
    Inventory.where(item_id: self.id).pluck(:quantity).sum -
      Transaction.where(item_id: self.id).pluck(:quantity_purchased).sum
  end

  after_update :notify_any_watchers

  def notify_any_watchers
    watches.each do |watch|
      user = User.find_by(id: watch.user_id)
      next unless user
      watch.delete if notify_watcher(user)
    end
  end

  private

  def watches
    WatchedItem.where(item_id: self.id).
      where('price_in_cents > ?', self.price_in_cents).
      group_by { |h| h.user_id }.
      map { |h,v| v.max }
  end

  def notify_watcher watcher
    begin
      WatchedItemMailer.price_threshold_email(
        user: watcher,
        item: self
      ).deliver_now
    rescue => e
      return false
    end
    true
  end
end
