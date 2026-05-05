import 'package:emm_final_project/data/datasources/app_database.dart';
import 'package:emm_final_project/data/repositories/auth_pepository_impl.dart';
import 'package:emm_final_project/data/repositories/route_repository_impl.dart';
import 'package:emm_final_project/domain/repositories/auth_repository.dart';
import 'package:emm_final_project/domain/repositories/route_repository.dart';
import 'package:emm_final_project/domain/usecases/create_route_usecase.dart';
import 'package:emm_final_project/domain/usecases/delete_route_usecase.dart';
import 'package:emm_final_project/domain/usecases/get_all_routes_usecase.dart';
import 'package:emm_final_project/domain/usecases/update_route_usecase.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_bloc.dart';
import 'package:emm_final_project/presentation/blocs/route/route_bloc.dart';
import 'package:emm_final_project/presentation/blocs/station/station_bloc.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // База данных
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Репозитории
  sl.registerLazySingleton<IRouteRepository>(() => RouteRepositoryImpl(sl()));
  // Регистрируем репозиторий авторизации
  sl.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(FirebaseAuth.instance));

  // Use Cases
  sl.registerLazySingleton(() => GetAllRoutesUseCase(sl()));
  sl.registerLazySingleton(() => CreateRouteUseCase(sl()));
  sl.registerLazySingleton(() => UpdateRouteUseCase(sl()));
  sl.registerLazySingleton(() => DeleteRouteUseCase(sl()));

  // Блоки (BLoCs)
  sl.registerFactory(() => RouteBloc(
        getAllRoutes: sl(),
        createRoute: sl(),
        updateRoute: sl(),
        deleteRoute: sl(),
      ));
  sl.registerFactory(() => StationBloc(repository: sl()));
  // Регистрируем AuthBloc
  sl.registerFactory(() => AuthBloc(repository: sl()));

  sl.registerFactory(() => ThemeBloc(prefs: sl()));
}