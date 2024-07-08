import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

import 'custom_app_bar.dart';
import 'item_in_list_posters.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index)=>Padding(
              padding:  EdgeInsets.symmetric(
                vertical: AppResponsive.verticalPadding(context, 30),
                horizontal: AppResponsive.horizontalPadding(context, 30),
              ),
              child: ItemInListPosters(),
            ),
          
          ),
        ),
      ],
    );
  }
}
