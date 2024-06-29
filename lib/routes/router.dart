import 'package:desoto_web/presentation/base_page.dart';
import 'package:desoto_web/presentation/desktop/authorization/auth_page.dart';
import 'package:desoto_web/presentation/desktop/registration/registration_page.dart';
import 'package:desoto_web/presentation/desktop/tasks/tasks_page.dart';
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
    GoRoute(
      name: 'registration',
      path: '/registration',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      name: 'auth',
      path: '/auth',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      name: 'tasks',
      path: '/tasks',
      builder: (context, state) => const TasksPage(),
    ),
  ],
);
