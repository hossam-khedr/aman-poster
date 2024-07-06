import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/di.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/cubit.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/states.dart';

import '../../../../core/constants/app_strings.dart';

class PasswordShowOrNotShow extends StatelessWidget {
  const PasswordShowOrNotShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var autCubit = getIt<AuthenticationCubit>();
    return BlocProvider.value(
      value: autCubit,
      child: BlocBuilder<AuthenticationCubit, AuthenticationStates>(
          builder: (context, state) {
        return TextButton(
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
        );
      }),
    );
  }
}
