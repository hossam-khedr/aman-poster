import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/constants/app_strings.dart';
import 'package:supabase_test/features/poster/presentation/widgets/item_in_child_in_drawer.dart';

import '../../../../core/route_generator/routes.dart';

class ChildInDrawer extends StatefulWidget {
  const ChildInDrawer({super.key});

  @override
  State<ChildInDrawer> createState() => _ChildInDrawerState();
}

class _ChildInDrawerState extends State<ChildInDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          child: Stack(
            children: [
              Image.asset('assets/png/Group 1.png'),
              Positioned(
                left: AppResponsive.horizontalPadding(context, 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Text(
                      AppStrings.exit,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: MediaQuery.textScalerOf(context).scale(20)
                      ),
                    )),
              )
            ],
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppResponsive.verticalPadding(context, 25),
            horizontal: AppResponsive.horizontalPadding(context, 35),
          ),
          decoration: BoxDecoration(),
        ),
        ItemInChildInDrawer(
          title: AppStrings.addNewPoster,
          icon: Icons.add,
          onTap: () {
            Navigator.pushNamed(context, Routes.addPoster);
          },
        ),
        ItemInChildInDrawer(
          title: AppStrings.report,
          icon: Icons.post_add,
          onTap: () {},
        ),
        ItemInChildInDrawer(
          title: AppStrings.setting,
          icon: Icons.settings,
          onTap: () {},
        ),
        ItemInChildInDrawer(
          title: AppStrings.signOut,
          icon: Icons.logout,
          iconColor: Colors.redAccent,
          textColor: Colors.redAccent,
          onTap: () {},
        ),
      ],
    );
  }
}
