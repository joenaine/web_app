import 'dart:developer';

import 'package:desoto_web/presentation/common_widgets/app_hide_keyboard_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/fifth_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/footer_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/fourth_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/header_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/primary_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/second_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/sixth_desktop_widget.dart';
import 'package:desoto_web/presentation/desktop/widgets/third_desktop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  final ScrollController _scrollController = ScrollController();
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50),
                child: Column(
                  children: [
                    HeaderDesktopWidget(
                      scrollController: _scrollController,
                    ),
                    const SizedBox(height: 100),
                    const PrimaryDesktopWidget(),
                  ],
                ),
              ),
              const SecondDesktopWidget(),
              const ThirdDesktopWidget(),
              const FourthDesktopWidget(),
              const FifthDesktopWidget(),
              const SixthDesktopWidget(),
              const FooterDesktopWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 50.0, bottom: 50),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 300,
                    child: Text(
                        'Контактные сведения:\narebro.eth@gmail.com\nАдрес: Казахстан, Зеленый Бор, УЛИЦА ШКОЛЬНАЯ, дом 4, кв/офис 2\nБИН (ИИН): 040313550642'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
