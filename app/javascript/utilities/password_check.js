document.addEventListener("turbolinks:load", function() {
  const passwordField = document.querySelector('#user_password')
  const passwordConfirmationField = document.querySelector('#user_password_confirmation')

  function checkPasswordsMatch() {
    if (!passwordField || !passwordConfirmationField) return

    const password = passwordField.value.trim()
    const passwordConfirmation = passwordConfirmationField.value.trim()

    if (passwordConfirmation.length > 0) {
      passwordConfirmationField.style.backgroundColor = (password === passwordConfirmation) ? 'lightgreen' : 'lightcoral'
    } else if (password.length > 0) {
      passwordConfirmationField.style.backgroundColor = 'lightcoral'
    } else {
      passwordConfirmationField.style.backgroundColor = ''
    }
  }

  if (passwordField) {passwordField.addEventListener('input', checkPasswordsMatch)}
  if (passwordConfirmationField) {passwordConfirmationField.addEventListener('input', checkPasswordsMatch)}
})
