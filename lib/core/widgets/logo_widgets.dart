import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:svg_flutter/svg.dart';

class LogoWidgets extends StatelessWidget {
  const LogoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/Group 1.png',
      width: AppResponsive.getWidth(context, 3),
      height:AppResponsive.getHeight(context, 6) ,
    );
  }
}
