class OrdermailerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ordermailer_mailer.receipt.subject
  #
  def receipt(order)
    @order=order

    mail to: @order.email, subject: "You are all signed up for Betty!"
  end
end
