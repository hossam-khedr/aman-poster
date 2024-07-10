import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/features/poster/presentation/screens/add_poster/widgets/add_poster_body.dart';

class AddPosterScreen extends StatefulWidget {
  const AddPosterScreen({super.key});

  @override
  State<AddPosterScreen> createState() => _AddPosterScreenState();
}

class _AddPosterScreenState extends State<AddPosterScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.horizontalPadding(context, 30),
              vertical: AppResponsive.verticalPadding(context, 20)
            ),
            child: AddPosterBody(),
          ),
        ),
      ),
    );
  }
}
