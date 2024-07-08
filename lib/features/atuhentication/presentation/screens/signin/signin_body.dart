import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_error_state.dart';
import 'package:supabase_test/core/helper/app_states/pub_up_loading_state.dart';
import 'package:supabase_test/core/helper/validation.dart';
import 'package:supabase_test/core/route_generator/routes.dart';
import 'package:supabase_test/core/widgets/logo_widgets.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/cubit.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/states.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_test/features/atuhentication/presentation/widgets/password_input.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../widgets/forgot_password.dart';
import '../../widgets/hint_text.dart';
import '../../widgets/password_show_or_not_show.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthenticationCubit>().formKey,
      child: ListView(
        children: [
          SizedBox(
            height: AppResponsive.verticalSpace(context, 12),
          ),
          const LogoWidgets(),
          SizedBox(
            height: AppResponsive.verticalSpace(context, 10),
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
          SizedBox(
            height: AppResponsive.verticalSpace(context, 50),
          ),
          HintWidget(
            hintText: AppStrings.password,
          ),
          BlocBuilder<AuthenticationCubit, AuthenticationStates>(
            builder: (context, state) {
              return TextFormFieldWidget(
                controller:
                    context.read<AuthenticationCubit>().passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: context.read<AuthenticationCubit>().isPasswordShow,
                suffixIcon: TextButton(
                  onPressed: () {
                    context.read<AuthenticationCubit>().passwordShow();
                  },
                  child: Text(
                    context.read<AuthenticationCubit>().isPasswordShow == true
                        ? AppStrings.show
                        : AppStrings.dontShow,
                    style: TextStyle(
                      color:
                          context.read<AuthenticationCubit>().isPasswordShow ==
                                  true
                              ? Colors.orange
                              : Colors.grey,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                validator: (value) {
                  if (!isPasswordValid(value)) {
                    return AppStrings.passwordErrorMassage;
                  }
                  return null;
                },
              );
            },
          ),
          const ForgotPassword(),
          SizedBox(
            height: AppResponsive.verticalSpace(context, 30),
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
                Navigator.pushReplacementNamed(context, Routes.main);
              }
            },
            child: ButtonWidget(
              height: 20,
              width: 0,
              title: AppStrings.signIn,
              onPressed: () {
                if (context
                    .read<AuthenticationCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<AuthenticationCubit>().signIn();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
