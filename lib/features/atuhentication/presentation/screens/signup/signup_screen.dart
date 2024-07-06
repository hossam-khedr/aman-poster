import 'package:flutter/material.dart';
import 'package:supabase_test/features/atuhentication/presentation/screens/signup/sign_up_body.dart';

import '../../../../../core/app_responsev/app_responsev.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            child: const SignUpBody(),
          ),
        ),
      ),
    );
  }
}
