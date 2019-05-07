/*open faq*/

const registerButton = document.querySelector('.register-button')
registerButton.addEventListener('click', event => {
  // stops any default actions from happening
  event.preventDefault()
  const frontEl = document.querySelector('.front')
  frontEl.classList.add('fade')
})
