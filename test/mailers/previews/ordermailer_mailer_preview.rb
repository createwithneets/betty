# Preview all emails at http://localhost:3000/rails/mailers/ordermailer_mailer
class OrdermailerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ordermailer_mailer/receipt
  def receipt
    OrdermailerMailer.receipt
  end

end
