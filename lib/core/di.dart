import 'package:get_it/get_it.dart';
import 'package:supabase_test/features/atuhentication/data/auth_repository/auth_repository.dart';
import 'package:supabase_test/features/atuhentication/data/data_source.dart';
import 'package:supabase_test/features/atuhentication/data/remote/supabase_services.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/cubit.dart';
import 'package:supabase_test/features/poster/data/data_source.dart';
import 'package:supabase_test/features/poster/data/repo/poster_repo.dart';
import 'package:supabase_test/features/poster/presentation/logic/cubit.dart';

import '../features/poster/data/remote/supabase_services.dart';

final getIt = GetIt.instance;

Future<void> initAuthModule() async {
  getIt.registerFactory<DataSource>(
    () => SupaBaseServices(),
  );
  getIt.registerFactory<AuthRepository>(
    () => AuthRepository(
      dataSource: getIt(),
    ),
  );
  getIt.registerFactory(() => AuthenticationCubit(getIt()));
}

Future<void> initPosterModule() async {
  getIt.registerLazySingleton<PosterDataSource>(
    () => PosterSupaBaseServices(),
  );
  getIt.registerLazySingleton<PosterRepo>(
    () => PosterRepo(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<PosterCubit>(
    () => PosterCubit(
      posterRepo: getIt(),
    ),
  );
}
