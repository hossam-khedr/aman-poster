import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/constants/app_strings.dart';
import 'package:supabase_test/core/widgets/button_widget.dart';
import 'package:supabase_test/core/widgets/text_form_field_widget.dart';
import 'package:supabase_test/features/atuhentication/presentation/widgets/hint_text.dart';

import 'clint_type.dart';
import 'license_information.dart';
import 'license_type.dart';

class AddPosterBody extends StatefulWidget {
  const AddPosterBody({super.key});

  @override
  State<AddPosterBody> createState() => _AddPosterBodyState();
}

var clintNameController = TextEditingController();
var clintMobileController = TextEditingController();
var posterNumberController = TextEditingController();

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
          controller: clintNameController,
          obscureText: false,
          keyboardType: TextInputType.name,
        ),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        TextFormFieldWidget(
          hintText: AppStrings.clintPhone,
          controller: clintMobileController,
          obscureText: false,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(
          height: AppResponsive.verticalSpace(context, 50),
        ),
        TextFormFieldWidget(
          hintText: AppStrings.surrealThePoster,
          controller: posterNumberController,
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
        ButtonWidget(
          width: 0,
          height: 20,
          title: AppStrings.addNewPoster,
          onPressed: (){},
        )
      ],
    );
  }
}
