import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/constants/constants.dart';
import 'package:supabase_test/core/route_generator/routes.dart';

import '../../../../atuhentication/data/remote/supabase_services.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/main_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.horizontalPadding(context, 30),
              vertical: AppResponsive.verticalPadding(context, 40)
            ),
            child: MainBody(),
          ),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
