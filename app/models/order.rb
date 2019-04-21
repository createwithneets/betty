class Order < ApplicationRecord

  has_many :order_items


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :stripe_token, presence: true

  accepts_nested_attributes_for :order_items

    def add_from_cart(cart)
      cart.order_items.all.each do |item|
        self.order_items.new(product: item.product, quantity: item.quantity)
        #for each item in the cart, take the cart and add it to the order itself including the item product and the quantity
      end

    end




    def total_price
      @total= 0
      order_items.each do |item|
        @total= @total + item.product.price_with_tax * item.quantity + 1500
      end

      @total
    end


    def total_price_in_dollars
      @total= 0
        order_items.each do |item|
    @total= @total + item.product.price_in_dollars * item.quantity
        end

      @total
    end


    def total_tax
      @total= 0
        order_items.each do |item|
    @total= item.product.price_in_dollars * item.quantity * 0.12
        end

        @total
      end

      def total_price_with_tax
        @total= 0
          order_items.each do |item|
      @total= item.product.price_in_dollars * item.quantity * 1.12
          end

          @total
        end

        def total_price_dollared
          @total= 0
          order_items.each do |item|
            @total= @total + item.product.price_with_tax.price_in_dollars * item.quantity + 1500
          end

          @total
        end

end
