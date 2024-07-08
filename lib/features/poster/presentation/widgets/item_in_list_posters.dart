import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

class ItemInListPosters extends StatefulWidget {
  const ItemInListPosters({super.key});

  @override
  State<ItemInListPosters> createState() => _ItemInListPostersState();
}

class _ItemInListPostersState extends State<ItemInListPosters> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.all(10),
      height: AppResponsive.getHeight(context, 5),
      decoration: BoxDecoration(
        //color: Colors.white60,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color:Colors.orange ,
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
              spreadRadius: 1
          )
        ]
      ),
    );
  }
}
