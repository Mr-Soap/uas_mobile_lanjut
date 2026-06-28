import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/news/presentation/bloc/news_bloc.dart';
import '../../features/news/presentation/bloc/news_event.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../di/service_locator.dart';
import 'route_names.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: RouteNames.home,

    routes: [
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<NewsBloc>()
              ..add(const GetTopHeadlinesEvent()),
            child: const HomePage(),
          );
        },
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}