import 'package:effective_mobile/config/constants/app_colors.dart';
import 'package:effective_mobile/config/constants/app_text_styles.dart';
import 'package:effective_mobile/config/constants/app_texts.dart';
import 'package:effective_mobile/feature/data/data_sources/api_service/api_service.dart';
import 'package:effective_mobile/feature/data/models/hotel_model.dart';
import 'package:effective_mobile/feature/presentation/pages/hotel/room_page.dart';
import 'package:effective_mobile/feature/presentation/widgets/carousel_widget.dart';
import 'package:effective_mobile/feature/presentation/widgets/cont_widget.dart';
import 'package:effective_mobile/feature/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class HotelPage extends StatefulWidget {
  final String title;
  const HotelPage({super.key, required this.title});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  HotelModel? hotelModel;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    hotelModel = await ApiService().getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cont,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          AppTexts.hotel,
          style: TextStyles.hotel,
        ),
        elevation: 0,
      ),
      body: hotelModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: 375,
              height: 530,
              color: AppColors.cont,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CarouselWidget(
                        urls: [
                          "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
                          "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
                          "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg",
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            // ignore: sort_child_properties_last
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.star,
                                ),
                                Text(
                                  hotelModel!.ratingName,
                                  style: TextStyles.great,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.star,),
                          ),
                        ],
                      ),
                      Text(
                        hotelModel!.name,
                        style: TextStyles.makadi,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(hotelModel!.adress, style: TextStyles.madinat,),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            hotelModel!.minimalPrice.toString(),
                            style: TextStyles.ot,
                          ),
                          Text(
                            hotelModel!.priceForIt,
                            style: TextStyles.zaTur,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(AppTexts.obOtele, style: TextStyles.obOtele,),
                      const SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...hotelModel!.aboutTheHotel.peculiarities.map(
                            (e) => Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: AppColors.cont1,
                                  borderRadius: BorderRadius.circular(4),),
                              child:
                                  Text(e.toString(), style: TextStyles.zaTur,),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              AppTexts.thirdL,
                              style: TextStyles.zaTur,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            AppTexts.wifi,
                            style: TextStyles.zaTur,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        hotelModel!.aboutTheHotel.description,
                        style: TextStyles.vip,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: AppColors.cont1,
                        child: const Column(
                          children: [
                            ContWidget(
                              image: 'assets/images/emoji-happy.png',
                              text: AppTexts.udobstva,
                            ),
                            Divider(
                                indent: 20,
                                endIndent: 30,
                                color: AppColors.divider,),
                            ContWidget(
                              image: 'assets/images/close-square.png',
                              text: AppTexts.chtovkl,
                            ),
                            Divider(
                                indent: 20,
                                endIndent: 30,
                                color: AppColors.divider,),
                            ContWidget(
                              image: 'assets/images/tick-square.png',
                              text: AppTexts.chtonevkl,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomButton(
                        text: AppTexts.kvyboru,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RoomPage(),),);
                        },
                        title: hotelModel!.name.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}




