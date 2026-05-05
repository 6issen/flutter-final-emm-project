
import 'package:go_router/go_router.dart';
import 'package:emm_final_project/presentation/screens/login_screen.dart';
import 'package:emm_final_project/presentation/screens/home_screen.dart';
import 'package:emm_final_project/presentation/screens/create_route_screen.dart';
import 'package:emm_final_project/presentation/screens/stations_screen.dart';
import 'package:emm_final_project/presentation/screens/route_details_screen.dart';
import 'package:emm_final_project/presentation/screens/analytics_screen.dart';
import 'package:emm_final_project/presentation/screens/profile_screen.dart';
import 'package:emm_final_project/presentation/screens/main_navigation_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/create_route',
      builder: (context, state) => const CreateRouteScreen(),
    ),
    GoRoute(
      path: '/stations',
      builder: (context, state) {
        final routeId = state.extra as int? ?? 0;
        return StationsScreen(routeId: routeId);
      },
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final routeId = state.extra as int? ?? 0;
        return RouteDetailsScreen(routeId: routeId);
      },
    ),
    // нижняя панель навигации
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/home', builder: (context, state) => const HomeScreen())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/analytics', builder: (context, state) => const AnalyticsScreen())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen())],
        ),
      ],
    ),
  ],
);