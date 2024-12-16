import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBase(
              text: 'Code Challenge',
              fontSize: size.width * 0.04,
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
            _buildContainer()
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      color: Colors.transparent,
      width: 20,
      height: 20,
      child: const Icon(
        Icons.star,
        color: Colors.purple,
        size: 20,
      ),
    );
  }
}
