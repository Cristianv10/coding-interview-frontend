import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget children;
  final bool showSafeArea;
  const AppLayout({
    super.key,
    required this.children,
    this.showSafeArea = true,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: showSafeArea,
          bottom: showSafeArea,
          child: children,
        ),
      ),
    );
  }
}
