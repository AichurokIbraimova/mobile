import 'package:effective_mobile/config/constants/app_colors.dart';
import 'package:effective_mobile/config/constants/app_text_styles.dart';
import 'package:effective_mobile/config/constants/app_texts.dart';
import 'package:effective_mobile/config/helpers/parse_number_to_string.dart';
import 'package:effective_mobile/feature/data/data_sources/api_service/api_service.dart';
import 'package:effective_mobile/feature/data/models/register_model.dart';
import 'package:effective_mobile/feature/domain/entities/tourist_entity.dart';

import 'package:effective_mobile/feature/presentation/pages/hotel/payd_page.dart';
import 'package:effective_mobile/feature/presentation/widgets/custom_button.dart';
import 'package:effective_mobile/feature/presentation/widgets/text_form_widget.dart';
import 'package:effective_mobile/feature/presentation/widgets/tourist_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  RegisterModel? reservation;
  bool isLoading = false;
  final List<TouristEntity> tourists = [
    TouristEntity(
      firstName: TextEditingController(),
      lastName: TextEditingController(),
      birthDay: TextEditingController(),
      citizenship: TextEditingController(),
      passportNumber: TextEditingController(),
      passportValidityPeriod: TextEditingController(),
    ),
  ];

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    phoneMaskFormatter.clear();
    for (var tourist in tourists) {
      tourist.firstName.dispose();
      tourist.lastName.dispose();
      tourist.birthDay.dispose();
      tourist.citizenship.dispose();
      tourist.passportNumber.dispose();
      tourist.passportValidityPeriod.dispose();
    }
    super.dispose();
  }

  RegisterModel? registermodel;
  @override
  void initState() {
    super.initState();
    getData2();
  }

  void getData2() async {
    registermodel = await ApiService().getUsers2();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        title: const Text(
          AppTexts.booking,
          style: TextStyles.hotel,
        ),
        centerTitle: true,
      ),
      body: registermodel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: 149,
                                height: 29,
                                decoration: ShapeDecoration(
                                  color: AppColors.brown,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.star,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      registermodel!.ratingName,
                                      style: TextStyles.great,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                registermodel!.hotelAdress,
                                style: TextStyles.makadi,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                registermodel!.hotelAdress,
                                style: TextStyles.madinat,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 10,
                              right: 5,
                            ),
                            child: Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(140),
                                1: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.top,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.vylet,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        registermodel!.departure,
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.country,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        registermodel!.arrivalCountry,
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.dates,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        '${registermodel!.tourDateStart} – ${registermodel!.tourDateStop}',
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.numberNights,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        '${registermodel!.numberOfNights}',
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.hotel,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        registermodel!.hotelName,
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.nomer,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        registermodel!.room,
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        AppTexts.nutrition,
                                        style: TextStyles.zaTur,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        registermodel!.nutrition,
                                        style: TextStyles.vip,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                AppTexts.information,
                                style: TextStyles.makadi,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormWidget(
                                keyboardType: TextInputType.number,
                                controller: phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Заполните поле';
                                  } else {
                                    return null;
                                  }
                                },
                                labelText: AppTexts.nomer,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormWidget(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Заполните поле';
                                  } else {
                                    return null;
                                  }
                                },
                                labelText: AppTexts.email,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                AppTexts.addtourist,
                                style: TextStyles.zaTur,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < tourists.length; i++)
                            Column(
                              children: [
                                TouristCardItemWidget(
                                  touristEntity: tourists[i],
                                  title: parseNumberToString(i + 1),
                                ),
                                if (i + 1 < tourists.length)
                                  const SizedBox(height: 8),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              tourists.add(
                                TouristEntity(
                                  firstName: TextEditingController(),
                                  lastName: TextEditingController(),
                                  birthDay: TextEditingController(),
                                  citizenship: TextEditingController(),
                                  passportNumber: TextEditingController(),
                                  passportValidityPeriod:
                                      TextEditingController(),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                AppTexts.addtourist,
                                style: TextStyles.makadi,
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 375,
                        height: 156,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    AppTexts.first,
                                    style: TextStyles.obOtele,
                                  ),
                                  Text(
                                    "${registermodel!.tourPrice} ₽",
                                    style: TextStyles.vip,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(AppTexts.topSbor,
                                      style: TextStyles.zaTur),
                                  Text("${registermodel!.fuelCharge} ₽",
                                      style: TextStyles.vip),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(AppTexts.serSbor,
                                      style: TextStyles.zaTur),
                                  Text(
                                    "${registermodel!.serviceCharge} ₽",
                                    style: TextStyles.vip,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(AppTexts.oplata,
                                      style: TextStyles.zaTur),
                                  Text(
                                      "${(registermodel!.tourPrice + registermodel!.fuelCharge + registermodel!.serviceCharge)} ₽",
                                      style: TextStyles.kvyboru),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: AppTexts.oplatit,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // print(emailController.text);
                            // print(phoneController.text);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaydPage(),
                              ),
                            );
                          }
                        },
                        // style: TextStyles.kvyboru,
                        title: '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
