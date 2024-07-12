import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/di.dart';
import 'package:supabase_test/features/poster/presentation/logic/cubit.dart';
import 'package:supabase_test/features/poster/presentation/logic/states.dart';

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
    var posterCubit = getIt<PosterCubit>();
    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: BlocBuilder<PosterCubit, PosterStates>(
            builder: (context, state) {
              if (state is PosterLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PosterErrorState) {
                return Center(
                  child: Text(state.errorMsg),
                );
              }
              if (state is GetPostersSuccessState) {
                return ListView.builder(
                  itemCount: state.posters.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          AppResponsive.horizontalPadding(context, 120),
                      vertical: AppResponsive.horizontalPadding(context, 20),
                    ),
                    child: ItemInListPosters(posterModel: state.posters[index],),
                  ),
                );
              }
              else{
                return SizedBox.shrink();
              }

            },
          ),
        ),
      ],
    );
  }
}
