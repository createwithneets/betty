/*open faq*/
document.addEventListener("DOMContentLoaded", function () {
  const registerButton = document.querySelector('.register-button')
  if (registerButton) {
    registerButton.addEventListener('click', event => {
      // stops any default actions from happening
      event.preventDefault()
      const frontEl = document.querySelector('.front')
      frontEl.classList.add('fade')
    })
  }
})

