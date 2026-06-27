import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

import 'route_names.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: RouteNames.home,

    routes: [

      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfilePage(),
      ),

    ],
  );
}