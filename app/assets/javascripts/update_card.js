var subscription;

jQuery(function() {
  Stripe.setPublishableKey($('meta[name="Rails.application.credentials[Rails.env.to_sym][:stripe_key]"]').attr('content'));
  return subscription.setUpForm();
});

subscription = {
  setUpForm: function() {
    return $('.update_subscriber').submit(function() {
      $('input[type="submit"]').attr('disabled', true);
      if ($('#card_number').length) {
        subscription.updateCard();
        return false;
      } else {
        return true;
      }
    });
  },
  updateCard: function() {
    var card;
    card = {
      number: $('#card_number').val(),
      cvc: $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear: $('#card_year').val()
    };
    return Stripe.createToken(card, subscription.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      $('#subscriber_stripe_card_token').val(response.id);
      return $('.update_subscriber')[0].submit();
    } else {
      $('#stripe_error').text(response.error.message);
      return $('input[type="submit"]').attr('disabled', false);
    }
  }
};
