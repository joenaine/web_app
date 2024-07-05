import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Divider(
        color: AppColors.gray,
        thickness: .3,
      ),
    );
  }
}

class AppSheetDivider extends StatelessWidget {
  const AppSheetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.gray,
      thickness: .3,
    );
  }
}
