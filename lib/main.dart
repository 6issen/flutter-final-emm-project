import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/injection_container.dart' as di;
import 'package:emm_final_project/presentation/blocs/route/route_bloc.dart';
import 'package:emm_final_project/presentation/blocs/route/route_event.dart';
import 'package:emm_final_project/presentation/blocs/station/station_bloc.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_bloc.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_event.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_bloc.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_event.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const RouteApp());
}

class RouteApp extends StatelessWidget {
  const RouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RouteBloc>(create: (_) => di.sl<RouteBloc>()..add(LoadRoutesEvent())),
        BlocProvider<StationBloc>(create: (_) => di.sl<StationBloc>()),
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()..add(CheckAuthEvent())),
        BlocProvider<ThemeBloc>(create: (_) => di.sl<ThemeBloc>()..add(LoadThemeEvent())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Маршрут машиниста',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: themeState.isDarkTheme ? Brightness.dark : Brightness.light, 
              ),
              useMaterial3: true,
            ),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}