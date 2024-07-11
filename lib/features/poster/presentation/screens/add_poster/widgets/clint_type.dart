import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/features/poster/presentation/logic/cubit.dart';
import 'package:supabase_test/features/poster/presentation/logic/states.dart';

import '../../../../../../core/constants/app_strings.dart';

class ClintType extends StatefulWidget {
  const ClintType({super.key});

  @override
  State<ClintType> createState() => _ClintTypeState();
}

class _ClintTypeState extends State<ClintType> {
  @override
  Widget build(BuildContext context) {
    var homeCubit = BlocProvider.of<PosterCubit>(context);
    return BlocProvider.value(
      value: homeCubit,
      child: BlocBuilder<PosterCubit, PosterStates>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text(
                    AppStrings.owner,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // fillColor:WidgetStateProperty.all(Colors.orange) ,
                  activeColor: Colors.orange,
                  value: AppStrings.owner,
                  groupValue: homeCubit.clintTypeGroupValue,
                  onChanged: (value) {
                    homeCubit.changeClintType(value);
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text(
                    AppStrings.agent,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Colors.orange,
                  value: AppStrings.agent,
                  groupValue: homeCubit.clintTypeGroupValue,
                  onChanged: (value) {
                    homeCubit.changeClintType(value);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
