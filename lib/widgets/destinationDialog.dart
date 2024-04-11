// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flightui/utils/constants.dart';
import 'package:flightui/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';

class DialogBox extends StatefulWidget {
  DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final FocusNode fromFocusNode = FocusNode();
  final FocusNode toFocusNode = FocusNode();
  final FocusNode whenFocusNode = FocusNode();
  final FocusNode returnFocusNode = FocusNode();
  final FocusNode passengersFocusNode = FocusNode();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();
  DateTime? _isPicked;
  bool isTrue = false;

  Future<void> _selecteDate(BuildContext context) async {
    _isPicked = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      barrierColor: AppColors.blackColor.withOpacity(0.5),
      firstDate: DateTime.now(),
      currentDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.blackColor,
              onPrimary: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      if (_isPicked == null) {
        _dateController.clear();
      } else {
        _dateController.text =
            "${_isPicked?.day}/${_isPicked?.month}/${_isPicked?.year}";
      }
    });
  }

  Future<void> _selecteReturnDate(BuildContext context) async {
    _returnDateController.clear();
    _isPicked = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      barrierColor: AppColors.blackColor.withOpacity(0.5),
      firstDate: DateTime.now(),
      currentDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.blackColor,
              onPrimary: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      if (_isPicked == null) {
        _returnDateController.clear();
      } else {
        _returnDateController.text =
            "${_isPicked?.day}/${_isPicked?.month}/${_isPicked?.year}";
      }
    });
  }

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
              GestureDetector(
                onTap: () => setState(() {
                  isTrue = false;
                }),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.vertical(
                          top: const Radius.circular(15))),
                  height: commonSize.height * 0.05,
                  width: commonSize.width * 0.3,
                  child: Text("One Way",
                      style: appTextStyle(
                          AppColors.blackColor,
                          isTrue == false
                              ? commonSize.height * 0.02
                              : commonSize.height * 0.018,
                          isTrue == false ? FontWeight.bold : FontWeight.w500)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isTrue = true;
                }),
                child: Container(
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
                    style: appTextStyle(
                        AppColors.blackColor,
                        isTrue
                            ? commonSize.height * 0.02
                            : commonSize.height * 0.018,
                        isTrue ? FontWeight.bold : FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ), // here
        Padding(
          padding: EdgeInsets.only(
            top: commonSize.height * 0.06,
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            height:
                isTrue ? commonSize.height * 0.45 : commonSize.height * 0.42,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedTextField(
                      HintText: "From ?",
                      iconData: MaterialIcons.flight_takeoff,
                      focusNode: fromFocusNode,
                    ),
                    RoundedTextField(
                      HintText: "where to?",
                      iconData: MaterialIcons.flight_land,
                      focusNode: toFocusNode,
                    ),
                    isTrue
                        ? Column(
                            children: [
                              RoundedTextField(
                                onTap: () {
                                  return _selecteDate(context);
                                },
                                isEnalbled: true,
                                controller: _dateController,
                                HintText: "Travelling when?",
                                iconData:
                                    MaterialCommunityIcons.calendar_arrow_right,
                                focusNode: whenFocusNode,
                              ),
                              Gap(commonSize.height * 0.008),
                              RoundedTextField(
                                onTap: () {
                                  return _selecteReturnDate(context);
                                },
                                isEnalbled: true,
                                controller: _returnDateController,
                                HintText: "Return When?",
                                iconData:
                                    MaterialCommunityIcons.calendar_arrow_left,
                                focusNode: returnFocusNode,
                              ),
                            ],
                          )
                        : RoundedTextField(
                            onTap: () {
                              return _selecteDate(context);
                            },
                            isEnalbled: true,
                            controller: _dateController,
                            HintText: "when?",
                            iconData: MaterialCommunityIcons.calendar_month,
                            focusNode: whenFocusNode,
                          ),
                    RoundedTextField(
                      HintText: "Passengers: 01",
                      iconData: MaterialIcons.person,
                      focusNode: passengersFocusNode,
                      isEnalbled: true,
                    ),
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
                  top: commonSize.height * 0.045,
                  child: CircleAvatar(
                    backgroundColor: AppColors.blackColor,
                    radius: isTrue
                        ? (commonSize.width * 0.14) / 2
                        : (commonSize.width * 0.15) / 2,
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
  // ignore: non_constant_identifier_names
  final String HintText;
  final IconData iconData;
  final FocusNode focusNode;
  final isEnalbled, controller;
  final onTap;

  const RoundedTextField({
    super.key,
    required this.HintText,
    required this.iconData,
    required this.focusNode,
    this.isEnalbled,
    this.controller,
    this.onTap,
  });
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
              padding: const EdgeInsets.only(bottom: 1.0),
              child: TextField(
                onTap: onTap,
                controller: controller,
                readOnly: isEnalbled ?? false,
                focusNode: focusNode,
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
