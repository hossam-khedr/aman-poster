import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_test/core/app_responsev/app_responsev.dart';
import 'package:supabase_test/core/route_generator/routes.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/app_states/pub_up_error_state.dart';
import '../../../../core/helper/app_states/pub_up_loading_state.dart';
import '../../../../core/helper/app_states/pub_up_success_state.dart';
import '../../../../core/widgets/logo_widgets.dart';
import 'alert_message.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      alertMessage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.05,
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: Column(
              children: [
                const LogoWidgets(),
               // PubUpLoadingState(),
               // PubUpErrorState(errorMessage: AppStrings.welcomeMassage,),
               // PubUpSuccessState(message: AppStrings.doneSignUpMessage,buttonTitle: 'ok',),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(color: Colors.orange, width: 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signIn);
                        },
                        child: Text(AppStrings.signIn,
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(16),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        child: Text(
                          AppStrings.joinNow,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.textScalerOf(context).scale(14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
