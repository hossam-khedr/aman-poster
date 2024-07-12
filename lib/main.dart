import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/core/di.dart';
import 'package:supabase_test/core/helper/bloc_observer.dart';
import 'package:supabase_test/core/route_generator/app_router.dart';
import 'package:supabase_test/core/theming/theming.dart';
import 'core/cache_helper/cache_helper.dart';
import 'core/constants/constants.dart';
import 'core/route_generator/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Constants.bataBaseUrl,
    anonKey: Constants.bataBaseKey,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.initCacheHelper();
  await initPosterModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: getApplicationTheme(Constants.lightTheme),
     initialRoute:Routes.splash,
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}
