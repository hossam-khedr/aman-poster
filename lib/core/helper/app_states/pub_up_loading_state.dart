import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';

import '../../constants/app_strings.dart';

class PubUpLoadingState extends StatelessWidget {
  const PubUpLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
         padding: EdgeInsets.all(AppResponsive.horizontalPadding(context, 30)),
        height: AppResponsive.getHeight(context, 10),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.orange,
              color: Colors.black,
            ),
            SizedBox(width: AppResponsive.horizontalSpace(context, 20),),
            Text(
              AppStrings.loadingMessage,
              style: TextStyle(
                fontSize: MediaQuery.textScalerOf(context).scale(20),
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
showPobUpLoadingState(BuildContext context){
  showDialog(context: context, builder: (context)=>const PubUpLoadingState());
}