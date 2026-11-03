import 'dart:async';
import '../models/user_model.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  // محاكاة قاعدة بيانات سريعة محلياً
  final List<UserModel> _usersDatabase = [];

  @override
  Future<UserModel> login(LoginRequest request) async {
    // محاكاة التأخير الشبكي (Network Delay)
    await Future.delayed(const Duration(seconds: 2));

    if (request.password == "Error123") {
      throw Exception("كلمة المرور غير صحيحة أو الحساب غير موجود");
    }

    return UserModel(
      fullName: "طالب جامعي مجتهد",
      academicId: request.identifier.contains('@') ? "441009876" : request.identifier,
      email: request.identifier.contains('@') ? request.identifier : "${request.identifier}@student.edu",
    );
  }

  @override
  Future<UserModel> register(RegisterRequest request) async {
    await Future.delayed(const Duration(seconds: 2));

    if (!request.agreedToTerms) {
      throw Exception("يجب الموافقة على اللوائح والشروط الأكاديمية");
    }

    final user = UserModel(
      fullName: request.fullName,
      academicId: request.academicId,
      email: request.email,
    );

    _usersDatabase.add(user);
    return user;
  }

  @override
  Future<bool> sendPasswordResetCode(String identifier) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<bool> resetPassword(String otpCode, String newPassword) async {
    await Future.delayed(const Duration(seconds: 2));

    if (otpCode != "123456") {
      // الرمز المقبول اختبيارياً للتجربة: 123456
      throw Exception("رمز التحقق (OTP) غير صحيح، جرب استخدام: 123456");
    }

    return true;
  }
}