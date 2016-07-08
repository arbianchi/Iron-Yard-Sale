module WatcherAction
  def find_watchers
    @watched_item.where(item_id: self.id).
      where(price_in_cents > self.price_in_cents).
      map { |record| record.user }.
      flatten
  end
end


end

module Watcher

class WatcherAction
  def initialize options={}
    @watched_item   = options[:watched_item]
    @users  = find_watchers



    private

    def find_watchers
      @watched_item.where(item_id: self.id).
        where(price_in_cents > self.price_in_cents).
        map { |record| record.user }.
        flatten
    end

end
