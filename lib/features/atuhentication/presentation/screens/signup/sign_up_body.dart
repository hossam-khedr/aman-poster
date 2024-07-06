import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_error_state.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_loading_state.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_success_state.dart';
import 'package:supabase_test/core/route_generator/routes.dart';
import 'package:supabase_test/core/widgets/button_widget.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/states.dart';

import '../../../../../core/app_responsev/app_responsev.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/helper/toastes.dart';
import '../../../../../core/helper/validation.dart';
import '../../../../../core/widgets/logo_widgets.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../logic/cubit.dart';
import '../../widgets/hint_text.dart';
import '../../widgets/password_show_or_not_show.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  void initState() {
    context.read<AuthenticationCubit>().formKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthenticationCubit>().formKey,
      child: ListView(
        children: [
          SizedBox(
            height: AppResponsive.verticalSpace(context, 15),
          ),
          const LogoWidgets(),
          SizedBox(
            height: AppResponsive.verticalSpace(context, 20),
          ),
          HintWidget(
            hintText: AppStrings.userName,
          ),
          TextFormFieldWidget(
            controller: context.read<AuthenticationCubit>().nameController,
            keyboardType: TextInputType.name,
            obscureText: false,
            validator: (value) {
              if (!isUserNameValid(value)) {
                return AppStrings.userNameErrorMassage;
              }
              return null;
            },
          ),
          HintWidget(
            hintText: AppStrings.email,
          ),
          TextFormFieldWidget(
            controller: context.read<AuthenticationCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            validator: (value) {
              if (!isEmailValid(value)) {
                return AppStrings.emailErrorMassage;
              }
              return null;
            },
          ),
          HintWidget(
            hintText: AppStrings.password,
          ),
          TextFormFieldWidget(
            controller: context.read<AuthenticationCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: context.read<AuthenticationCubit>().isPasswordShow,
            suffixIcon:  PasswordShowOrNotShow(),
            validator: (value) {
              if (!isPasswordValid(value)) {
                return AppStrings.passwordErrorMassage;
              }
              return null;
            },
          ),
          HintWidget(
            hintText: AppStrings.provinceName,
          ),
          TextFormFieldWidget(
            controller:
                context.read<AuthenticationCubit>().provinceNameController,
            keyboardType: TextInputType.streetAddress,
            obscureText: false,
            validator: (value) {
              if (!isProvinceNameValid(value)) {
                return AppStrings.provinceNameErrorMassage;
              }
              return null;
            },
          ),
          HintWidget(
            hintText: AppStrings.unitName,
          ),
          TextFormFieldWidget(
            controller: context.read<AuthenticationCubit>().unitNameController,
            keyboardType: TextInputType.streetAddress,
            obscureText: false,
            validator: (value) {
              if (!isUnitNameValid(value)) {
                return AppStrings.unitNameErrorMassage;
              }
              return null;
            },
          ),
          SizedBox(
            height: AppResponsive.verticalSpace(context, 20),
          ),
          BlocListener<AuthenticationCubit, AuthenticationStates>(
            listenWhen: (previous, current) {
              return previous != current;
            },
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
                doneToast(context,AppStrings.doneSignUpMessage);
                Future.delayed(Duration(milliseconds: 2), () {
                  Navigator.pushReplacementNamed(
                      context, Routes.signIn);
                });
              }
            },
            child: ButtonWidget(
              height: 20,
              width: 0,
              title: AppStrings.joinNow,
              onPressed: () {
                if (context
                    .read<AuthenticationCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<AuthenticationCubit>().signUp();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
