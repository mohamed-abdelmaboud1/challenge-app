import 'package:challenge_app/features/home/ui/views/home_view.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(path: Routes.home, builder: (context, state) => const HomeView()),
    ],
  );
}
