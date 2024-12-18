import 'package:flutter/material.dart';

class BackgroundDesign extends StatelessWidget {
  final Size size;

  const BackgroundDesign({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            color: const Color(0xFFE3FDFD),
          ),
          Positioned(
            top: 0,
            right: -50,
            child: Container(
              height: size.height,
              width: size.width * 0.6,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA726),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500),
                  bottomLeft: Radius.circular(500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
