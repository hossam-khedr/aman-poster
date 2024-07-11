import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/widgets/text_form_field_widget.dart';
import 'package:supabase_test/features/poster/presentation/logic/cubit.dart';

class LicenseInformation extends StatefulWidget {
  const LicenseInformation({super.key});

  @override
  State<LicenseInformation> createState() => _LicenseInformationState();
}

class _LicenseInformationState extends State<LicenseInformation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormFieldWidget(
            controller:context.read<PosterCubit>().text1Controller,
            obscureText: false,
            keyboardType: TextInputType.text,
            onChanged: (value){
              if(value.isNotEmpty){
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(width: AppResponsive.horizontalSpace(context, 60),),
        Expanded(
          child: TextFormFieldWidget(
            controller:context.read<PosterCubit>(). text2Controller,
            obscureText: false,
            keyboardType: TextInputType.text,
            onChanged: (value){
              if(value.isNotEmpty){
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(width: AppResponsive.horizontalSpace(context, 60),),
        Expanded(
          child: TextFormFieldWidget(
            controller:context.read<PosterCubit>(). text3Controller,
            obscureText: false,
            keyboardType: TextInputType.text,
            onChanged: (value){
              if(value.isNotEmpty){
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(width: AppResponsive.horizontalSpace(context, 60),),
        Expanded(
          flex: 4,
          child: TextFormFieldWidget(
            controller:context.read<PosterCubit>(). licenseNumberController,
            obscureText: false,
            keyboardType: TextInputType.number,
          ),
        ),

      ],
    );
  }
}
