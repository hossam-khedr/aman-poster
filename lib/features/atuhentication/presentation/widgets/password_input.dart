import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/di.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/cubit.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/states.dart';
import 'package:supabase_test/features/atuhentication/presentation/widgets/password_show_or_not_show.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/validation.dart';
import '../../../../core/widgets/text_form_field_widget.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
   // final authCubit = getIt<AuthenticationCubit>();
    return BlocProvider(
      create: (context)=>getIt<AuthenticationCubit>(),
      child: BlocBuilder<AuthenticationCubit, AuthenticationStates>(
        builder: (context,state){
          return TextFormFieldWidget(
            controller: context.read<AuthenticationCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: context.read<AuthenticationCubit>().isPasswordShow,
            suffixIcon:  TextButton(
              onPressed: () {
                context.read<AuthenticationCubit>().passwordShow();
              },
              child: Text(
                context.read<AuthenticationCubit>().isPasswordShow == true
                    ? AppStrings.show
                    : AppStrings.dontShow,
                style: TextStyle(
                  color: context.read<AuthenticationCubit>().isPasswordShow == true
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
    );
  }
}
