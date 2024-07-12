import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/constants/app_strings.dart';
import 'package:supabase_test/features/poster/data/models/poster_model.dart';

class ItemInListPosters extends StatefulWidget {
  final PosterModel posterModel;

  const ItemInListPosters({super.key, required this.posterModel});

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
                color: Colors.orange,
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
                spreadRadius: 1)
          ]),
      child: Stack(
        children: [
          Positioned(
            right: AppResponsive.horizontalSpace(context, 30),
            top: AppResponsive.verticalSpace(context, 100),
            child: Text(
              '${AppStrings.clintName} : ${widget.posterModel.clintName}',
            ),
          ),
          Positioned(
            right: AppResponsive.horizontalSpace(context, 30),
            top: AppResponsive.verticalSpace(context, 30),
            child: Text(
                '${AppStrings.clintPhone} : ${widget.posterModel.clintMobile}'),
          ),
          Positioned(
            right: AppResponsive.horizontalSpace(context, 30),
            top: AppResponsive.verticalSpace(context, 17),
            child: Text(
                '${AppStrings.clintType} : ${widget.posterModel.clintType}'),
          ),
          Positioned(
            right: AppResponsive.horizontalSpace(context, 30),
            top: AppResponsive.verticalSpace(context, 12),
            child: Text(
                '${AppStrings.licenseType} : ${widget.posterModel.licenseType}'),
          ),
          Positioned(
            right: AppResponsive.horizontalSpace(context, 30),
            top: AppResponsive.verticalSpace(context, 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(' ${AppStrings.numberOfCar} : '),
                Text(widget.posterModel.licenseCharacter1),
                Text(widget.posterModel.licenseCharacter2),
                Text(widget.posterModel.licenseCharacter3),
                SizedBox(
                  width: AppResponsive.horizontalSpace(context, 70),
                ),
                Text(widget.posterModel.licenseNumber),
              ],
            ),
          ),
          Positioned(
            left: AppResponsive.horizontalSpace(context, 30),
            bottom: AppResponsive.verticalSpace(context, 90),
            child: Text(
              '${AppStrings.surrealThePoster} : ${widget.posterModel.surrealNumberPoster}',
            ),
          ),
        ],
      ),
    );
  }
}
