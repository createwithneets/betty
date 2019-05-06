class User < ApplicationRecord

geocoded_by :city
after_validation :geocode

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true
validates :ig_username, presence: true
validates :address_1, presence: true
validates :city, presence: true
validates :country, presence: true
validates :stripe_token, presence: true, on: :create 


has_many :conversations, dependent: :destroy
has_secure_password

def save_and_subscribe
  if self.valid?
      #create a stripe customer
      customer = Stripe::Customer.create(source: self.stripe_token, description: self.email, coupon: self.coupon)

      #create a new subscription based off of customer ID and plan they signed up For
      subscription = Stripe::Subscription.
      create(customer: customer.id, items: [{plan: self.subscription_plan}])

      #save the customer ID to database
      self.stripe_customer = customer.id

      #save the subscription id to the database
      self.stripe_subscription = subscription.id

      #to assist with retrieving subscriptions in future ##
      @customer_id = customer.id

      self.update_attributes!(stripe_customer: @customer_id)
      @subscription_id = subscription.id
      self.update_attributes!(stripe_subscription: @subscription_id)

      #save everything
      self.save
    else

      false

    end

  rescue Stripe::CardError => e
    @message = e.json_body[:error][:message]
    self.errors.add(:stripe_token, @message)

    false

  end



  def destroy_and_unsubscribe
    #get the subscription from stripe
    subscription= Stripe::Subscription.retrieve(self.stripe_subscription)
    #delete that subscription
    subscription.delete
    #remove the user completely
    self.destroy
  end


  def self.search(ig_username)
      if ig_username
          ig_username.downcase!
          where('LOWER(ig_username) LIKE ?', "%#{ig_username}%")
      else
          all
      end
  end




  #add the photo uploader
  mount_uploader :photo, PhotoUploader
  mount_uploader :photogif, PhotoUploader
end
