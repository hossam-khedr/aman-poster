import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

class ItemInChildInDrawer extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final void Function()? onTap;

  const ItemInChildInDrawer({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  State<ItemInChildInDrawer> createState() => _ItemInChildInDrawerState();
}

class _ItemInChildInDrawerState extends State<ItemInChildInDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: MediaQuery.textScalerOf(context).scale(18),
          color: widget.textColor ?? Colors.white70,
        ),
      ),
      leading: Icon(
        widget.icon,
        color: widget.iconColor ?? Colors.orange,
        size: AppResponsive.getHeight(
          context,
          20,
        ),
      ),
      onTap: widget.onTap,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppResponsive.verticalSpace(context, 90),
        horizontal: AppResponsive.horizontalSpace(context, 70)
      ),
      splashColor: Colors.black87,
    );
  }
}
