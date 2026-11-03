import '../models/user_model.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';

abstract class AuthRepository {
  Future<UserModel> login(LoginRequest request);
  Future<UserModel> register(RegisterRequest request);
  Future<bool> sendPasswordResetCode(String identifier);
  Future<bool> resetPassword(String otpCode, String newPassword);
}