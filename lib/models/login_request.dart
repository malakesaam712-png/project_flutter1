class LoginRequest {
  final String identifier; // البريد أو الرقم الأكاديمي
  final String password;
  final bool rememberMe;

  LoginRequest({
    required this.identifier,
    required this.password,
    this.rememberMe = false,
  });
}