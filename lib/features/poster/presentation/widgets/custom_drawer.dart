import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

import 'child_in_drawer.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppResponsive.verticalPadding(context, 7),
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        width: AppResponsive.getWidth(context, 1.7),
       /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),*/
        child: ChildInDrawer(),
      ),
    );
  }
}
