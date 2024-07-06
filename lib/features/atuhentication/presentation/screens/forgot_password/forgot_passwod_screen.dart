import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_error_state.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_success_state.dart';
import 'package:supabase_test/core/helper/toastes.dart';
import 'package:supabase_test/core/route_generator/routes.dart';
import 'package:supabase_test/core/widgets/button_widget.dart';
import 'package:supabase_test/core/widgets/text_form_field_widget.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/cubit.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/states.dart';
import 'package:supabase_test/features/atuhentication/presentation/widgets/hint_text.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/helper/app_states/pub_up_loading_state.dart';
import '../../../../../core/helper/validation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.horizontalPadding(
                context,
                20,
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: AppResponsive.verticalSpace(
                    context,
                    8,
                  ),
                ),
                Text(
                  AppStrings.passwordRecovery,
                  style: TextStyle(
                    fontSize: MediaQuery.textScalerOf(context).scale(30),
                    color: Colors.black,
                  ),
                ),
                Text(
                  AppStrings.hintMassagePasswordRecovery,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: AppResponsive.verticalSpace(context, 30),
                ),
                HintWidget(hintText: AppStrings.email),
                Form(
                  key: context.read<AuthenticationCubit>().formKey,
                  child: TextFormFieldWidget(
                    controller:
                        context.read<AuthenticationCubit>().emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!isEmailValid(value)) {
                        return AppStrings.emailErrorMassage;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: AppResponsive.verticalSpace(context, 30),
                ),
                BlocListener<AuthenticationCubit, AuthenticationStates>(
                  listener: (context, state) {
                    if (state is AuthenticationLoadingState) {
                      showPobUpLoadingState(context);
                    }
                    if (state is AuthenticationErrorState) {
                      Navigator.pop(context);
                      showPubUpErrorState(context, state.errorMessage);
                    }
                    if (state is AuthenticationSuccessState) {
                      Navigator.pop(context);
                      doneToast(
                          context, AppStrings.successRecoverPasswordMassage);
                      Future.delayed(Duration(milliseconds: 2), () {
                        Navigator.pushReplacementNamed(
                            context, Routes.updatePassword);
                      });
                    }
                  },
                  child: ButtonWidget(
                    width: 0,
                    height: 20,
                    title: AppStrings.passwordRecovery,
                    onPressed: () {
                      if (context
                          .read<AuthenticationCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<AuthenticationCubit>().resetPassword();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
