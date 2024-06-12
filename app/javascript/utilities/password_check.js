document.addEventListener("turbolinks:load", function() {
  const passwordField = document.querySelector('#user_password')
  const passwordConfirmationField = document.querySelector('#user_password_confirmation')

  function checkPasswordsMatch() {
    if (passwordConfirmationField && passwordConfirmationField.value > 0) {
      let match = passwordField.value === passwordConfirmationField.value
      passwordConfirmationField.style.backgroundColor = match ? 'lightgreen' : 'lightcoral'
    }
  }

  if (passwordField) {passwordField.addEventListener('input', checkPasswordsMatch)}
  if (passwordConfirmationField) {passwordConfirmationField.addEventListener('input', checkPasswordsMatch)}
})
