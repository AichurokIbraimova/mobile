// ignore_for_file: sort_child_properties_last

import 'package:effective_mobile/config/constants/app_colors.dart';
import 'package:effective_mobile/config/constants/app_text_styles.dart';
import 'package:effective_mobile/config/constants/app_texts.dart';
import 'package:effective_mobile/feature/data/data_sources/api_service/api_service.dart';
import 'package:effective_mobile/feature/data/models/room_model.dart';
import 'package:effective_mobile/feature/presentation/pages/hotel/booking_page.dart';
import 'package:effective_mobile/feature/presentation/widgets/carousel_widget.dart';
import 'package:effective_mobile/feature/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<Room?> rooms = [];
  @override
  void initState() {
    super.initState();
    getData1();
  }

  void getData1() async {
    rooms = (await ApiService().getUsers1())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cont,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        backgroundColor: AppColors.white,
        title: const Text(
          AppTexts.makadi,
          style: TextStyles.hotel,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...rooms.map(
              (room) => Container(
                padding: const EdgeInsetsDirectional.all(16),
                width: double.infinity,
                color: AppColors.white,
                child: Column(
                  children: [
                    CarouselWidget(
                      urls: room!.imageUrls,
                    ),
                    Text(
                      room.name,
                      style: TextStyles.standart,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...room.peculiarities.map(
                          (e) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.cont,
                            ),
                            child: Text(
                              e.toString(),
                              style: TextStyles.zaTur,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 192,
                          height: 29,
                          // ignore: prefer_const_constructors
                          child: Row(
                            children: const [
                              Text(
                                AppTexts.podr,
                                style: TextStyles.podr,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColors.textMadinat,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.podrCont,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              "${room.price} ₽",
                              style: TextStyles.ot,
                            ),
                            Text(
                              room.pricePer.toString(),
                              style: TextStyles.zaTur,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomButton(
                      text: AppTexts.vybrat,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingPage(),
                          ),
                        );
                      },
                      title: '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          color: AppColors.white,
                          child: Image.asset(
                            'assets/images/image3.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
