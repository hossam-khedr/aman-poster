import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:svg_flutter/svg.dart';

import '../../constants/app_strings.dart';

class PubUpSuccessState extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  final String buttonTitle;

  const PubUpSuccessState({
    super.key,
    required this.message,
    this.onPressed,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10),
        height: AppResponsive.getHeight(context, 5),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/svg/done.svg',
              color: Colors.green,
              height: 50,
              width: 50,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(14),
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle,
                style: TextStyle(
                  fontSize: MediaQuery.textScalerOf(context).scale(14),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

showPubUpSuccessState({
  required BuildContext context,
  required String message,
  required String buttonTitle,
  void Function()? onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => PubUpSuccessState(
      message: message,
      buttonTitle: buttonTitle,
      onPressed: onPressed,
    ),
  );
}
