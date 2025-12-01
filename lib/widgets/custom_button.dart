import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool? outlined;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.outlined,
  });

  @override
  Widget build(BuildContext context) {
    final isOutlined = outlined == true;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : Colors.blueAccent,
          foregroundColor: isOutlined ? Colors.blueAccent : Colors.white,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isOutlined
                ? const BorderSide(color: Colors.blueAccent, width: 1.5)
                : BorderSide.none,
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        child: Text(label),
      ),
    );
  }
}
