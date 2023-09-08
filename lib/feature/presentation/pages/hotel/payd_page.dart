import 'package:effective_mobile/config/constants/app_colors.dart';
import 'package:effective_mobile/config/constants/app_text_styles.dart';
import 'package:effective_mobile/config/constants/app_texts.dart';
import 'package:effective_mobile/feature/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaydPage extends StatefulWidget {
  const PaydPage({super.key});

  @override
  State<PaydPage> createState() => _PaydPageState();
}

class _PaydPageState extends State<PaydPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cont,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        centerTitle: true,
        title: const Text(AppTexts.zakaz, style: TextStyles.hotel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 147),
            Container(
              width: 94,
              height: 94,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  1000,
                ),
                color: const Color(
                  0xFFF6F6F9,
                ),
              ),
              child: Image.asset(
                "assets/images/Party Popper.png",
                height: 188,
                width: 247,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              AppTexts.prinyat,
              style: TextStyles.makadi,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                AppTexts.podtverj,
                style: TextStyles.zaTur,
              ),
            ),
            const Divider(
              indent: 20,
              endIndent: 30,
              color: AppColors.divider,
            ),
            CustomButton(
              text: AppTexts.super1,
              onPressed: () {},
              title: '',
            ),
          ],
        ),
      ),
    );
  }
}
