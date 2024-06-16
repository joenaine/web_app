import 'package:desoto_web/presentation/base_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const BasePage(),
    ),
    //
  ],
);
