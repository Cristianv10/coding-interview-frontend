import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.isEnabled});

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280.w,
        child: ElevatedButton(
          onPressed: isEnabled ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Cambiar',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
