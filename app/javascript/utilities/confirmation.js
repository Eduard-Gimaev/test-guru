document.addEventListener('turbolinks:load', function(){
    var password = document.getElementById('user_password')
    var passwordConfirmation = document.getElementById('user_password_confirmation')

    if (password && passwordConfirmation) {passwordConfirmation.addEventListener('input', password_check)}
  })


function password_check() {
    if (document.getElementById('user_password').value ==
        document.getElementById('user_password_confirmation').value) {
            document.querySelector('.octicon-alert').classList.add('hide')
            document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    } else {
        document.querySelector('.octicon-alert').classList.remove('hide')
        document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    }
}
    
