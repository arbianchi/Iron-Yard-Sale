class WatchedItemMailer < ApplicationMailer
  #default from: 'watched_items@...herokuapp.com
  URL = "http://localhost:3000"
  def price_threshold_email options
    @user = options[:user]
    @item = options[:item]
    @url = URL + "/stores/:store_id/items/:item_id"
    mail(to: @user.email, subject: 'Iron-Yard-Sale Price Update!')
  end
end
