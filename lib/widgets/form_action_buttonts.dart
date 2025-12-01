import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:lab_assignment/widgets/custom_button.dart';

class FormActionButtons extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onGuestLogin;
  final VoidCallback onLogin;

  const FormActionButtons({
    super.key,
    required this.onSubmit,
    required this.onGuestLogin,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(label: 'Register', onPressed: onSubmit),
        SizedBox(height: 16),
        CustomButton(
          label: 'Login as Guest',
          onPressed: onGuestLogin,
          outlined: true,
        ),
        SizedBox(height: 22),
        RichText(
          text: TextSpan(
            text: 'Have an account? ',
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()..onTap = onLogin,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
