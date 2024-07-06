import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onPressed;
  final String title;

  const ButtonWidget(
      {super.key,
      required this.width,
      required this.height,
      this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppResponsive.horizontalSpace(context, width),
      height: AppResponsive.verticalSpace(context, height),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title,style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}
