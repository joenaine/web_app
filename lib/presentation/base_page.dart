import 'package:desoto_web/presentation/common_widgets/responsive_builder.dart';
import 'package:desoto_web/presentation/desktop/desktop_home_page.dart';
import 'package:desoto_web/presentation/mobile/mobile_home_page.dart';
import 'package:desoto_web/presentation/task_generator/task_generator_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        mobileBuilder: (context, constraints) => const MobileHomePage(),
        desktopBuilder: (context, constraints) => const DesktopHomePage());
  }
}
