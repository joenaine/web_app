import 'dart:developer';

import 'package:desoto_web/presentation/common_widgets/app_hide_keyboard_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/fifth_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/footer_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/fourth_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/header_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/primary_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/second_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/sixth_mobile_widget.dart';
import 'package:desoto_web/presentation/mobile/widget/third_mobile_widget.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  // @override
  // void initState() {
  //   _scrollController.addListener(_printScrollPosition);
  //   super.initState();
  // }

  // void _printScrollPosition() {
  //   log("Scroll Position: ${_scrollController.position.pixels}");
  // }

  @override
  Widget build(BuildContext context) {
    return AppHideKeyBoardWidget(
        child: Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeaderMobileWidget(scrollController: _scrollController),
            PrimaryMobileWidget(
              scrollController: _scrollController,
            ),
            const SecondMobileWidget(),
            ThirdMobileWidget(pageController: _pageController),
            const FourthMobileWidget(),
            const FifthMobileWidget(),
            const SixthMobileWidget(),
            const FooterMobileWidget()
          ],
        ),
      ),
    ));
  }
}
