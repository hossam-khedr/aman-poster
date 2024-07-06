import 'package:flutter/material.dart';
import 'package:supabase_test/core/route_generator/routes.dart';

import '../../../../core/constants/app_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgotPassword);
        },
        child: Text(
          AppStrings.forgotPassword,
          style: const TextStyle(
            color: Colors.orange,
          )
        ),
      ),
    );
  }
}