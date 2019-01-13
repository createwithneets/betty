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
customer = Stripe::Customer.create(source: self.stripe_token, description: self.email)

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

end
