verfiySamePassword(String? password, String? passwordConfirm) {
  if (password != passwordConfirm) {
    return 'Passwords are different';
  }
  return '';
}
