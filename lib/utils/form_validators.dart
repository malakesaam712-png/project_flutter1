class FormValidators {
  // التحقق من المعرف أو البريد (≥ 5 خانات)
  static String? validateIdentifier(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال المعرف الأكاديمي أو البريد الإلكتروني';
    }
    if (value.trim().length < 5) {
      return 'يجب أن يكون المعرف 5 خانات على الأقل';
    }
    return null;
  }

  // التحقق من كلمة المرور البسيطة لشاشة الدخول (≥ 6 محارف)
  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن لا تقل عن 6 محارف';
    }
    return null;
  }

  // التحقق من الاسم الكامل (≥ 3 محارف)
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال الاسم الكامل';
    }
    if (value.trim().length < 3) {
      return 'يجب أن يتكون الاسم من 3 محارف على الأقل';
    }
    return null;
  }

  // الرقم الأكاديمي (أرقام حصراً، 9-10 خانات)
  static String? validateAcademicId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال الرقم الأكاديمي';
    }
    final isNumeric = RegExp(r'^[0-9]+$').hasMatch(value.trim());
    if (!isNumeric) {
      return 'الرقم الأكاديمي يجب أن يحتوي على أرقام فقط';
    }
    if (value.trim().length < 9 || value.trim().length > 10) {
      return 'يجب أن يكون الرقم الأكاديمي بين 9 إلى 10 أرقام';
    }
    return null;
  }

  // البريد الجامعي (Regex قياسي)
  static String? validateUniversityEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال البريد الجامعي';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'يرجى إدخال صيغة بريد إلكتروني صحيحة';
    }
    return null;
  }

  // سياسة كلمة المرور القوية (≥ 8 محارف + رقم + حرف كبير)
  static String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تتكون من 8 محارف على الأقل';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل (A-Z)';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل (0-9)';
    }
    return null;
  }

  // تأكيد كلمة المرور
  static String? validateConfirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    }
    if (value != originalPassword) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }

  // رمز التحقق OTP (6 أرقام رقمية حصراً)
  static String? validateOTP(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رمز التحقق';
    }
    if (value.trim().length != 6 || !RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
      return 'رمز التحقق يجب أن يتكون من 6 أرقام حصراً';
    }
    return null;
  }
}