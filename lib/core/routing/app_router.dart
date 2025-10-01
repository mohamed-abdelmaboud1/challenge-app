import 'package:go_router/go_router.dart';

import '../../features/home/ui/views/dots_view.dart';
import 'routes.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(path: Routes.home, builder: (context, state) => const DotsView()),
    ],
  );
}
