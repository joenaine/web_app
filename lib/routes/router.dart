import 'package:desoto_web/presentation/base_page.dart';
import 'package:desoto_web/presentation/common_widgets/responsive_builder.dart';
import 'package:desoto_web/presentation/desktop/authorization/auth_page.dart';
import 'package:desoto_web/presentation/desktop/payment/payment_page.dart';
import 'package:desoto_web/presentation/desktop/registration/registration_page.dart';
import 'package:desoto_web/presentation/desktop/tasks/tasks_page.dart';
import 'package:desoto_web/presentation/mobile/mob_auth/mob_auth_page.dart';
import 'package:desoto_web/presentation/mobile/mob_registration/mob_registration_page.dart';
import 'package:flutter/foundation.dart';
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
      builder: (context, state) => ResponsiveBuilder.isDesktop(context)
          ? const RegistrationPage()
          : const MobRegistrationPage(),
    ),
    GoRoute(
      name: 'auth',
      path: '/auth',
      builder: (context, state) => ResponsiveBuilder.isDesktop(context)
          ? const AuthPage()
          : const MobAuthPage(),
    ),
    GoRoute(
      name: 'tasks',
      path: '/tasks',
      builder: (context, state) => const TasksPage(),
    ),
    GoRoute(
      name: 'payment',
      path: '/payment',
      builder: (context, state) => const PaymentPage(),
    ),
  ],
);
