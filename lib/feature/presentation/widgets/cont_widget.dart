import 'package:effective_mobile/config/constants/app_text_styles.dart';
import 'package:effective_mobile/config/constants/app_texts.dart';
import 'package:flutter/material.dart';

class ContWidget extends StatelessWidget {
  final String image;
  final String text;
  const ContWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 100),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text),
                      const Text(
                        AppTexts.samoe,
                        style: TextStyles.zaTur,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ],
        ),
      ],
    );
  }
}
