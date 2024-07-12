import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/core/di.dart';
import 'package:supabase_test/core/route_generator/routes.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/cubit.dart';
import 'package:supabase_test/features/atuhentication/presentation/screens/forgot_password/forgot_passwod_screen.dart';
import 'package:supabase_test/features/atuhentication/presentation/screens/signin/signin_screen.dart';
import 'package:supabase_test/features/atuhentication/presentation/screens/signup/signup_screen.dart';
import 'package:supabase_test/features/opening/screens/welcome/welcome_screen.dart';
import 'package:supabase_test/features/poster/presentation/logic/cubit.dart';
import 'package:supabase_test/features/poster/presentation/screens/main/main_screen.dart';

import '../../features/atuhentication/presentation/screens/update_password/update_password_screen.dart';
import '../../features/poster/presentation/screens/add_poster/add_poster_screen.dart';

class AppRouter {
  static Route generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.signIn:
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthenticationCubit>(),
            child: const SignInScreen(),
          ),
        );
      case Routes.signUp:
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthenticationCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthenticationCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case Routes.updatePassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthenticationCubit>(),
            child: const UpdatePasswordScreen(),
          ),
        );
      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_)=>getIt<PosterCubit>()..getPosters(),
            child: const MainScreen(),
          ),
        );
      case Routes.addPoster:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<PosterCubit>(),
            child: const AddPosterScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
