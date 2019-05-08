class Cart < ApplicationRecord

  has_many :order_items

  def total_quantity
    @count= 0
    order_items.all.each do |item|
      @count = @count + item.quantity
    end

    @count

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
    order_items.all.each do |item|
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

        scope :between, -> (sender_id,receiver_id) do
          where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
      end

      def recipient(current_user)
      self.sender_id == current_user.id ? self.receiver : self.sender
      end

end
