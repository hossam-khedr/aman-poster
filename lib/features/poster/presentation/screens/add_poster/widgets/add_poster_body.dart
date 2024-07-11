import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/constants/app_strings.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_error_state.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_loading_state.dart';
import 'package:supabase_test/core/route_generator/routes.dart';
import 'package:supabase_test/core/widgets/button_widget.dart';
import 'package:supabase_test/core/widgets/text_form_field_widget.dart';
import 'package:supabase_test/features/atuhentication/presentation/widgets/hint_text.dart';
import 'package:supabase_test/features/poster/presentation/logic/states.dart';

import '../../../logic/cubit.dart';
import 'clint_type.dart';
import 'license_information.dart';
import 'license_type.dart';

class AddPosterBody extends StatefulWidget {
  const AddPosterBody({super.key});

  @override
  State<AddPosterBody> createState() => _AddPosterBodyState();
}

class _AddPosterBodyState extends State<AddPosterBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            AppStrings.addNewPoster,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 40),
        ),
        TextFormFieldWidget(
          hintText: AppStrings.clintName,
          controller: context.read<PosterCubit>().clintNameController,
          obscureText: false,
          keyboardType: TextInputType.name,
        ),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        TextFormFieldWidget(
          hintText: AppStrings.clintPhone,
          controller: context.read<PosterCubit>().clintMobileController,
          obscureText: false,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        TextFormFieldWidget(
          hintText: AppStrings.surrealThePoster,
          controller: context.read<PosterCubit>().posterNumberController,
          obscureText: false,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        HintWidget(hintText: AppStrings.numberOfCar),
        LicenseInformation(),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        LicenseType(),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        ClintType(),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 20),
        ),
        BlocListener<PosterCubit, PosterStates>(
          listener: (context, state) {
            if (state is PosterLoadingState) {
              showPobUpLoadingState(context);
            }
            if (state is PosterErrorState) {
              showPubUpErrorState(context, state.errorMsg);
            }
            if (state is PosterSuccessState) {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: AppStrings.addedPosterSuccess,
                backgroundColor: Colors.green,
              );
              Future.delayed(Duration(milliseconds: 2),(){
                Navigator.pushReplacementNamed(context, Routes.main);
              });
            }
          },
          listenWhen: (previous, current) {
            return previous != current;
          },
          child: ButtonWidget(
            width: 0,
            height: 20,
            title: AppStrings.addNewPoster,
            onPressed: () {
              context.read<PosterCubit>().addPoster();
            },
          ),
        )
      ],
    );
  }
}
