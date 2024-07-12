import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/route_generator/routes.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
var userId = CacheHelper.getData(Constants.userId);

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, userId == null?Routes.signIn:Routes.main);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.orange,
        child: Image.asset(
          'assets/png/Group 1.png',
        ),
      ),
    );
  }
}
