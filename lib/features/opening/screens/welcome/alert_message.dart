import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_responsev/app_responsev.dart';
import '../../../../core/constants/app_strings.dart';
void alertMessage(BuildContext context){
  Flushbar(
    title: AppStrings.alert,
    message: AppStrings.welcomeMassage,
    backgroundColor: Colors.orangeAccent,
    textDirection: TextDirection.rtl,
    titleColor: Colors.black,
    messageSize: MediaQuery.textScalerOf(context).scale(16),
    titleSize: MediaQuery.textScalerOf(context).scale(20),
    margin: EdgeInsets.symmetric(
        vertical: AppResponsive.verticalPadding(context, 30),
        horizontal: AppResponsive.horizontalPadding(context, 35)),
    borderRadius: BorderRadius.circular(10),
    icon: const Icon(Icons.warning,size: 30,color: Colors.redAccent,),
  ).show(context);
}
