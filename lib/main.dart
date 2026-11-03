import 'package:flutter/material.dart';
import 'repositories/auth_repository_impl.dart';
import 'controllers/auth_controller.dart';
import 'views/auth/login_page.dart';

void main() {
  runApp(const StudentAuthApp());
}

class StudentAuthApp extends StatefulWidget {
  const StudentAuthApp({Key? key}) : super(key: key);

  @override
  State<StudentAuthApp> createState() => _StudentAuthAppState();
}

class _StudentAuthAppState extends State<StudentAuthApp> {
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    // تهيئة Repository و Controller بطريقة نظيفة (Dependency Injection)
    final repository = AuthRepositoryImpl();
    _authController = AuthController(repository: repository);
  }

  @override
  void dispose() {
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نظام المصادقة الطلابي',
      debugShowCheckedModeBanner: false,
      // دعم الاتجاه من اليمين إلى اليسار (RTL) للغة العربية
      locale: const Locale('ar', ''),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: LoginPage(controller: _authController),
    );
  }
}