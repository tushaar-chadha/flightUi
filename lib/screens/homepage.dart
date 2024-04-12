import 'dart:math';

import 'package:flightui/utils/constants.dart';
import 'package:flightui/utils/textstyles.dart';
import 'package:flightui/widgets/destinationDialog.dart';
import 'package:flightui/widgets/ticketWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late var commonSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: commonSize.height * 0.3,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(commonSize.width * 0.05,
                    commonSize.height * 0.06, commonSize.width * 0.05, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Tickets",
                      style: appTextStyle(AppColors.primaryColor,
                          commonSize.width * 0.05, FontWeight.w700),
                    ),
                    Container(
                      height: commonSize.height * 0.07,
                      width: commonSize.width * 0.38,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Balance",
                                  style: appTextStyle(
                                      AppColors.blackColor,
                                      commonSize.width * 0.025,
                                      FontWeight.w600),
                                ),
                                Text(
                                  "Rs.10,023/-",
                                  style: appTextStyle(
                                      AppColors.blackColor,
                                      commonSize.width * 0.038,
                                      FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: (commonSize.width * 0.135) / 2.2,
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(
                              Octicons.person,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: commonSize.height * 0.14,
                    left: commonSize.width * 0.08,
                    right: commonSize.width * 0.08),
                child: DialogBox(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: commonSize.height * 0.66,
                    left: commonSize.width * 0.08,
                    right: commonSize.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Flight Routes",
                      style: appTextStyle(AppColors.blackColor,
                          commonSize.width * 0.04, FontWeight.bold),
                    ),
                    Text(
                      "view all",
                      style: appTextStyle(AppColors.blackColor,
                          commonSize.width * 0.03, FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),
          Gap(commonSize.height * 0.02),
          SizedBox(
            width: double.maxFinite,
            height: commonSize.height * 0.2,
            child: PageView.builder(
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Adjust this according to your needs
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const TicketShape(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
