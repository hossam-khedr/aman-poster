import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:svg_flutter/svg.dart';

import '../../constants/app_strings.dart';

class PubUpErrorState extends StatelessWidget {
  final String errorMessage;

  const PubUpErrorState({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      icon: SvgPicture.asset(
        'assets/svg/error.svg',
        color: Colors.red,
        height: 50,
        width: 50,
      ),
      title: Text(
        AppStrings.error,
        style: TextStyle(fontSize: MediaQuery.textScalerOf(context).scale(18)),
      ),
      content: Text(errorMessage),
    );
  }
}

showPubUpErrorState(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) => PubUpErrorState(errorMessage: errorMessage),
  );
}
