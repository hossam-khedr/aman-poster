import 'package:flutter/material.dart';

abstract class AppResponsive {
  static double horizontalPadding(BuildContext context, double width) {
    var mediaQueryWidth = MediaQuery.sizeOf(context).width;
    return mediaQueryWidth / width;
  }
  static double verticalPadding(BuildContext context, double height) {
    var mediaQueryWidth = MediaQuery.sizeOf(context).height;
    return mediaQueryWidth / height;
  }

  static double horizontalSpace(BuildContext context, double width) {
    var mediaQueryWidth = MediaQuery.sizeOf(context).width;
    return mediaQueryWidth / width;
  }
  static double verticalSpace(BuildContext context, double height) {
    var mediaQueryWidth = MediaQuery.sizeOf(context).height;
    return mediaQueryWidth / height;
  }
  static double getWidth(BuildContext context, double width) {
    var mediaQueryWidth = MediaQuery.sizeOf(context).width;
    return mediaQueryWidth / width;
  }
  static double getHeight(BuildContext context, double height) {
    var mediaQueryWidth = MediaQuery.sizeOf(context).height;
    return mediaQueryWidth / height;
  }
}
