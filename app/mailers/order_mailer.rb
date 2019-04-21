class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.receipt.subject
  #
  def receipt(order, amount)
    #we want to use @order in our views so we have to define it
    @order = order
    @final_amount = amount/100.00

    mail to: @order.email, subject: "Thank you for Ordering from Betty!"
  end

  def confirmation(order, amount)
    @order= order
    @final_amount = amount/100.00

  mail to: 'hello@anitacheung.ca', subject: "An order has come through!"
  end


  def total_price_dollared
    @total= 0
    order_items.each do |item|
      @total= @total + item.product.price_with_tax.price_in_dollars * item.quantity + 1500
    end


    @total
  end

end
