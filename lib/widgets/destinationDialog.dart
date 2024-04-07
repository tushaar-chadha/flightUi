import 'package:flightui/utils/constants.dart';
import 'package:flightui/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    var commonSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.bottomCenter,
                child: Text("One Way",
                    style: appTextStyle(AppColors.blackColor,
                        commonSize.height * 0.018, FontWeight.w600)),
                decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius:
                        BorderRadius.vertical(top: const Radius.circular(15))),
                height: commonSize.height * 0.05,
                width: commonSize.width * 0.3,
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                height: commonSize.height * 0.05,
                width: commonSize.width * 0.3,
                child: Text(
                  "Round Trip",
                  style: appTextStyle(AppColors.blackColor,
                      commonSize.height * 0.018, FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: commonSize.height * 0.06,
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: commonSize.height * 0.45,
            width: commonSize.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColors.blackColor.withOpacity(0),
                    offset: const Offset(1, 2),
                    blurRadius: 2,
                    spreadRadius: 1)
              ],
              border: Border.all(color: AppColors.borderColor, width: 2),
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const RoundedTextField(
                      HintText: "From ?",
                      iconData: MaterialIcons.flight_takeoff,
                    ),
                    const RoundedTextField(
                      HintText: "where to?",
                      iconData: MaterialIcons.flight_land,
                    ),
                    const RoundedTextField(
                      HintText: "where to?",
                      iconData: MaterialCommunityIcons.calendar_month,
                    ),
                    const RoundedTextField(
                        HintText: "Passengers: 01",
                        iconData: MaterialIcons.person),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Search Flight",
                          style: appTextStyle(
                              AppColors.primaryColor, 12, FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: commonSize.width * 0.1,
                  top: commonSize.height * 0.055,
                  child: CircleAvatar(
                    backgroundColor: AppColors.blackColor,
                    radius: (commonSize.width * 0.14) / 2,
                    child: Icon(
                      CupertinoIcons.arrow_swap,
                      size: commonSize.width * 0.06,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String HintText;
  final IconData iconData;

  const RoundedTextField(
      {super.key, required this.HintText, required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 2),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: Icon(iconData),
          ),
          Container(
            width: 1.0,
            height: 30.0,
            color: AppColors.blackColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: TextField(
                style: appTextStyle(Colors.grey.shade600, 14, FontWeight.w600),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  hintText: HintText,
                  hintStyle:
                      appTextStyle(Colors.grey.shade500, 12, FontWeight.w600)
                          .copyWith(),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
