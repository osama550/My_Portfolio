import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/constant.dart';
import 'package:my_portfolio/core/router/app_routes.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Constants.initialLocation,
    routes: [
      GoRoute(
        path: AppRoutes.homeView,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
