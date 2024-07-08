import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/widgets/text_form_field_widget.dart';

import '../../../../core/constants/app_strings.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

var searchController = TextEditingController();

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormFieldWidget(
            controller: searchController,
            obscureText: false,
            prefixIcon: Icon(
              Icons.search_outlined,
            ),
            hintText: AppStrings.searchOfPoster,
          ),
        ),
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.notes,
            size: AppResponsive.getHeight(
              context,
              20,
            ),
          ),
        ),
      ],
    );
  }
}
