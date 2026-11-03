class RegisterRequest {
  final String fullName;
  final String academicId;
  final String email;
  final String password;
  final bool agreedToTerms;

  RegisterRequest({
    required this.fullName,
    required this.academicId,
    required this.email,
    required this.password,
    required this.agreedToTerms,
  });
}