import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

import 'signin_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.horizontalPadding(context, 20),
            ),
            child:const SignInBody(),
          ),
        ),
      ),
    );
  }
}
