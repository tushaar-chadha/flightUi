import 'package:flightui/utils/constants.dart';
import 'package:flightui/utils/textstyles.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late var commonSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: commonSize.height * 0.3,
          decoration: const BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: commonSize.height * 0.07,
              left: commonSize.width * 0.05,
              right: commonSize.width * 0.05),
          child: Row(
            children: [
              Text(
                "My Tickets",
                style:
                    appTextStyle(AppColors.primaryColor, 18, FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }
}
