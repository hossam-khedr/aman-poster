import 'package:flutter/material.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/widgets/text_form_field_widget.dart';

class LicenseInformation extends StatefulWidget {
  const LicenseInformation({super.key});

  @override
  State<LicenseInformation> createState() => _LicenseInformationState();
}
var text1Controller = TextEditingController();
var text2Controller = TextEditingController();
var text3Controller = TextEditingController();
var licenseNumberController = TextEditingController();
class _LicenseInformationState extends State<LicenseInformation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormFieldWidget(
            controller: text1Controller,
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
            controller: text2Controller,
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
            controller: text3Controller,
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
            controller: licenseNumberController,
            obscureText: false,
            keyboardType: TextInputType.number,
          ),
        ),

      ],
    );
  }
}
