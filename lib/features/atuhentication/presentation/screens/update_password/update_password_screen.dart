import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_test/features/atuhentication/presentation/widgets/password_input.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/app_responsev/app_responsev.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/helper/app_states/pub_up_error_state.dart';
import '../../../../../core/helper/app_states/pub_up_loading_state.dart';
import '../../../../../core/helper/app_states/pub_up_success_state.dart';
import '../../../../../core/helper/toastes.dart';
import '../../../../../core/helper/validation.dart';
import '../../../../../core/route_generator/routes.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../logic/cubit.dart';
import '../../logic/states.dart';
import '../../widgets/hint_text.dart';
import '../../widgets/password_show_or_not_show.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  // bool isConditionDone = false;

  @override
  void initState() {
    context.read<AuthenticationCubit>().passwordController.addListener(() {
      context.read<AuthenticationCubit>().isNewPasswordValid();
    });

    super.initState();
  }

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
            child: Form(
              key: context.read<AuthenticationCubit>().formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: AppResponsive.verticalSpace(
                      context,
                      8,
                    ),
                  ),
                  Text(
                    AppStrings.newPassword,
                    style: TextStyle(
                      fontSize: MediaQuery.textScalerOf(context).scale(30),
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    AppStrings.hintResetPasswordMassage,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: AppResponsive.verticalSpace(context, 30),
                  ),
                  HintWidget(hintText: AppStrings.updatePassword),
                 PasswordInput(),
                  SizedBox(
                    height: AppResponsive.verticalSpace(context, 50),
                  ),
                  HintWidget(hintText: AppStrings.doneResetPassword),
                  TextFormFieldWidget(
                    controller: context
                        .read<AuthenticationCubit>()
                        .confirmPasswordController,
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (!context
                          .read<AuthenticationCubit>()
                          .isConfirmPasswordValid(value)) {
                        return AppStrings.confirmPasswordErrorMassage;
                      }
                      return null;
                    },
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
                        doneToast(context,AppStrings.updatePasswordSuccessMessage);
                        Future.delayed(Duration(milliseconds: 2), () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signIn);
                        });
                      }
                    },
                    child: ButtonWidget(
                      width: 0,
                      height: 20,
                      title: AppStrings.doneResetPassword,
                      onPressed: () {
                        if (context
                            .read<AuthenticationCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<AuthenticationCubit>().updatePassword();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppResponsive.verticalSpace(context, 20),
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/done.svg',
                            color: state is SmallCharacterState
                                ? Colors.green
                                : Colors.grey,
                          ),
                          Text(
                            AppStrings.smallCharacter,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/done.svg',
                            color: state is PagCharacterState
                                ? Colors.green
                                : Colors.grey,
                          ),
                          Text(
                            AppStrings.pagCharacter,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/done.svg',
                            color: state is NumberSuccessState
                                ? Colors.green
                                : Colors.grey,
                          ),
                          Text(
                            AppStrings.numberCharacter,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/done.svg',
                            color: state is SpecialCharacterState
                                ? Colors.green
                                : Colors.grey,
                          ),
                          Text(
                            AppStrings.specialCharacter,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/done.svg',
                            color: state is YoungerThan8CharacterState
                                ? Colors.green
                                : Colors.grey,
                          ),
                          Text(
                            AppStrings.notYoungerThan8Character,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


