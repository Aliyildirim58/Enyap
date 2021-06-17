class SigninValidationMixin {
  String Validatenickname(String nickname) {
    if (nickname.length < 2 || nickname.length > 15) {
      return "Yanlış Nickname";
    }
  }
  String Validatepassword(String password) {
    if (password.length < 2 || password.length > 15) {
      return "Şifre Yanlış";
    }
  }
}
