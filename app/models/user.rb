class User < ApplicationRecord


validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true
validates :ig_username, presence: true
validates :address_1, presence: true
validates :city, presence: true
validates :country, presence: true
validates :stripe_token, presence: true



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



  def update_with_stripe(form_params)
    #update the model with the form params
    #check if it's valid
    # if it's valid, update stripe
    #then update the database

    self.assign_attributes(form_params)
    if self.valid?
    #get the subscription from stripe

    subscription = Stripe::Subscription.retrieve(self.stripe_subscription)
    #get the first item from the subscription
    #we don't want BOTH plans, we want to update one with the other
    item_id= subscription.items.data[0].id
    #make our new items
    items = [
      {id: item_id, plan:self.subscription_plan}
    ]
    #update our subscription with the new items
    subscription.items = items
    #save the subscription to stripe
    subscription.save
    #save our data to the database
    self.save
    else
      false
    end

    end

    def update_card(form_params)
      customer = Stripe::Customer.retrieve(self.stripe_customer)
      card = customer.sources.create(card: stripe_card_token)
      card.save
      customer.default_source = card.id
      customer.save
    rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while updating card info: #{e.message}"
      errors.add :base, "#{e.message}"
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



  #add the photo uploader
  mount_uploader :photo, PhotoUploader

end
