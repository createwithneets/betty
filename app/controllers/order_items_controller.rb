class OrderItemsController < ApplicationController

  def create
  #find the product
  @product= Product.find(params[:product_id])
  #cart= @current_cart

  #quantity?- comes from the form data
  @quantity= form_params[:quantity]
  # we are only grabbing the quantity from the form data (there is only one form field anyway)

@current_cart.order_items.create(product: @product, quantity: @quantity)
#we want to create from scratch order_Items in to cart where the product is the product from the URL

flash[:success] = "Item is added to your cart!"

redirect_to product_path(@product)
end



def update
@product= Product.find(params[:product_id])
@order_item= OrderItem.find(params[:id])
#find the quantity from form and update accordingly
@order_item.update(form_params)

flash[:success] = "Thanks for updating your cart!"

redirect_to product_path(@product)

end


def destroy
  @product= Product.find(params[:product_id])
  @order_item= OrderItem.find(params[:id])

  @order_item.delete

flash[:success] = "Product removed from cart"

  redirect_to cart_path
end



def form_params
  params.require(:order_item).permit(:quantity)
end




end
