class AccountsController < ApplicationController

before_action :force_login
  def edit
    #this is from the application_controller rb and how its' done before every action
    @user= @current_user
  end



  def update

      @user= @current_user
      if @user.update_with_stripe(form_params)
        flash[:success] = "Your account has been updated"
      end

    if @user.update_card(@user, params[:stripe_card_token])
      flash[:success] = 'Saved. Your card information has been updated.'
      redirect_to user_path(@user.ig_username)
    else
      flash[:warning] = 'Stripe reported an error while updating your card. Please try again.'
      render "edit"
    end
  end





def destroy
  @current_user.destroy_and_unsubscribe
  reset_session
  redirect_to root_path
end



def form_params
  params.require(:user).permit(:password, :password_confirmation, :photo, :about, :photogif, :check_in_q_1, :check_in_q_2, :check_in_q_3, :MHSquote_1, :MHSquote_2,
  :MHSquote_3, :MHSIG_1, :MHSIG_3, :MHSIG_2, :MHSIG_4, :MHSIG_5, :MHSbook_1, :MHSbook_2, :MHSbook_3, :MHSbook_4, :MHSbook_5, :MHSproduct_1, :MHSroduct_2, :MHSproduct_3,
:MHSproduct_4, :MHSproduct_5, :MHSroutine_1, :MHSroutine_2, :MHSroutine_3, :MHSgeneral_1, :MHSgeneral_3, :MHSgeneral_4, :MHSgeneral_5, :stripe_token, :stripe_card_token)
end

end
