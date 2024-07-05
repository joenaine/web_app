import 'dart:math';

import 'package:desoto_web/core/constants/app_assets.dart';
import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/presentation/common_widgets/responsive_builder.dart';
import 'package:desoto_web/presentation/task_generator/task_screen.dart';
import 'package:desoto_web/presentation/task_generator/widgets/general_button.dart';
import 'package:desoto_web/presentation/task_generator/widgets/text_fontsize.dart';
import 'package:flutter/material.dart';

import 'task_screen_mobile.dart';

class TaskGenerator extends StatefulWidget {
  const TaskGenerator({super.key});

  @override
  State<TaskGenerator> createState() => _TaskGeneratorState();
}

class _TaskGeneratorState extends State<TaskGenerator> {
  bool isLoading = false;
  int? queryNumber;
  String? aiResponse;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) => queryNumber != null
          ? TaskScreenMobile(
              queryNumber: queryNumber!,
            )
          : Scaffold(
              appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
              body: SingleChildScrollView(
                child: Center(
                  child: isLoading
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * .3),
                          child: Column(
                            children: [
                              const CircularProgressIndicator(
                                color: AppColors.dark,
                              ),
                              const SizedBox(height: 20),
                              TextSize.s18w700('Генерируем задачу')
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.images.wand,
                                height: size.height * .12),
                            const SizedBox(height: 30),
                            TextSize.s32w700('Сгенерируй\nзадание на дизайн'),
                            const SizedBox(height: 30),
                            TextSize.s16w400(
                                'Используй этот простой генератор,\n чтобы получить рандомное задание\nдля практики твоих дизайнерских навыков. \nТы получишь тематику проекта, \nцветовую гамму, графику и немного контента.',
                                textAlign: TextAlign.center),
                            const SizedBox(height: 50),
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: GeneralButton(
                                text: 'Сгенерировать задание',
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Future.delayed(const Duration(seconds: 2))
                                      .then((value) {
                                    setState(() {
                                      isLoading = false;
                                      queryNumber = Random().nextInt(5);
                                    });
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
      desktopBuilder: (context, constraints) => queryNumber != null
          ? TaskScreen(queryNumber: queryNumber!)
          : Scaffold(
              appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
              body: SingleChildScrollView(
                child: Center(
                  child: isLoading
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * .3),
                          child: Column(
                            children: [
                              const CircularProgressIndicator(
                                color: AppColors.dark,
                              ),
                              const SizedBox(height: 20),
                              TextSize.s18w700('Генерируем задачу')
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.images.wand,
                                height: size.height * .15),
                            const SizedBox(height: 15),
                            TextSize.s56w700('Сгенерируй\nзадание на дизайн'),
                            const SizedBox(height: 30),
                            TextSize.s14w500(
                                'Используй этот простой генератор, чтобы получить рандомное задание\nдля практики твоих дизайнерских навыков. Ты получишь тематику\nпроекта, цветовую гамму, графику и немного контента.'),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: 400,
                              height: 50,
                              child: GeneralButton(
                                text: 'Сгенерировать задание',
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  // aiResponse = await AiRepository.sendRequest(
                                  //     locale: 'en');
                                  Future.delayed(const Duration(seconds: 2))
                                      .then((value) {
                                    setState(() {
                                      isLoading = false;
                                      queryNumber = Random().nextInt(5);
                                    });
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
    );
  }
}
