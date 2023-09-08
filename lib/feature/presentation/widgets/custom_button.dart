import 'package:effective_mobile/config/constants/app_colors.dart';
import 'package:effective_mobile/config/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required String title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.white,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textMadinat,
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyles.kvyboru,
            ),
          ),
        ),
      ],
    );
  }
}
