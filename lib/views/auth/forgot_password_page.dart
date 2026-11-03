import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/form_validators.dart';
import 'reset_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  final AuthController controller;

  const ForgotPasswordPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();

  @override
  void dispose() {
    _identifierController.dispose();
    super.dispose();
  }

  void _handleSendCode() async {
    if (_formKey.currentState!.validate()) {
      final success = await widget.controller.sendPasswordResetCode(_identifierController.text.trim());
      if (mounted) {
        if (success) {
          // إظهار SnackBar أخضر عند النجاح
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إرسال رمز التحقق بنجاح إلى هاتفك/بريدك! (رمز الاختبار: 123456)'),
              backgroundColor: Colors.green,
            ),
          );
          // الانتقال التلقائي لشاشة تعيين كلمة المرور
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ResetPasswordPage(controller: widget.controller),
            ),
          );
        } else if (widget.controller.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(widget.controller.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('استعادة كلمة المرور')),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // بطاقة توجيهية أعلى الشاشة
                  Card(
                    color: Colors.blue.shade50,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.blue.shade200),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'سيتم إرسال رمز تحقق (OTP) من 6 أرقام إلى بريدك الأكاديمي المسجل أو هاتفك لاستعادة الحساب.',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  TextFormField(
                    controller: _identifierController,
                    decoration: const InputDecoration(
                      labelText: 'البريد الجامعي أو الرقم الأكاديمي',
                      prefixIcon: Icon(Icons.mail_lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: FormValidators.validateIdentifier,
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: widget.controller.isLoading ? null : _handleSendCode,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: widget.controller.isLoading
                        ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                        : const Text('إرسال رمز التحقق', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 12),

                  // زر العودة لشاشة الدخول
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('العودة لتسجيل الدخول'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}