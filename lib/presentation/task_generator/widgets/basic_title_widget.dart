import 'package:desoto_web/presentation/task_generator/widgets/text_fontsize.dart';
import 'package:flutter/material.dart';

import 'app_divider.dart';

class BasicTitleTaskWidget extends StatelessWidget {
  const BasicTitleTaskWidget({
    super.key,
    required this.title,
    required this.children,
  });
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: size.width * .22, child: TextSize.s12w400(title)),
              SizedBox(
                width: size.width * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
              SizedBox(width: size.width * .1)
            ],
          ),
        ),
        const SizedBox(height: 50),
        const AppDivider(),
      ],
    );
  }
}
