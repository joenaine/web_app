import 'dart:math';

import 'package:desoto_web/application/auth/auth_bloc.dart';
import 'package:desoto_web/application/bloc/profile_bloc.dart';
import 'package:desoto_web/core/app_styles.dart';
import 'package:desoto_web/core/constants/app_assets.dart';
import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/presentation/common_widgets/responsive_builder.dart';
import 'package:desoto_web/presentation/task_generator/task_screen.dart';
import 'package:desoto_web/presentation/task_generator/widgets/general_button.dart';
import 'package:desoto_web/presentation/task_generator/widgets/text_fontsize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'mobile/task_screen_mobile.dart';

int? queryNumber;

class TaskGenerator extends StatefulWidget {
  const TaskGenerator({super.key});

  @override
  State<TaskGenerator> createState() => _TaskGeneratorState();
}

class _TaskGeneratorState extends State<TaskGenerator> {
  bool isLoading = false;

  String? aiResponse;

  final user = FirebaseAuth.instance.currentUser;
  final bool _isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.mapOrNull(
          authenticated: (value) {
            context
                .read<ProfileBloc>()
                .add(ProfileEvent.getProfile(id: user!.uid));
          },
        );
      },
      builder: (context, state) {
        return state.map(
            initial: (_) => const Scaffold(body: Text('Не авторизован')),
            authenticated: (e) => ResponsiveBuilder(
                  mobileBuilder: (context, constraints) => queryNumber != null
                      ? TaskScreenMobile(
                          queryNumber: queryNumber!,
                        )
                      : Scaffold(
                          drawer: BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return state.map(initial: (value) {
                                return const SizedBox();
                              }, loading: (value) {
                                return const SizedBox();
                              }, success: (e) {
                                return MyDrawer(
                                  headerTitle: e.userModel?.name ?? '',
                                );
                              }, failure: (value) {
                                return const SizedBox();
                              });
                            },
                          ),
                          body: SingleChildScrollView(
                            child: Center(
                              child: isLoading
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * .3),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) {
                                            return state.map(
                                              initial: (value) {
                                                return const SizedBox();
                                              },
                                              loading: (value) {
                                                return const SizedBox();
                                              },
                                              success: (value) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Scaffold.of(context)
                                                              .openDrawer();
                                                        },
                                                        child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: const Icon(
                                                                Icons.menu)),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              failure: (value) {
                                                return const SizedBox();
                                              },
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 40),
                                        Image.asset(AppAssets.images.wand,
                                            height: size.height * .12),
                                        const SizedBox(height: 30),
                                        TextSize.s32w700(
                                            'Сгенерируй\nзадание на дизайн'),
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
                                              Future.delayed(const Duration(
                                                      seconds: 2))
                                                  .then((value) {
                                                setState(() {
                                                  isLoading = false;
                                                  queryNumber =
                                                      Random().nextInt(5);
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
                          drawer: BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return state.map(initial: (value) {
                                return const SizedBox();
                              }, loading: (value) {
                                return const SizedBox();
                              }, success: (e) {
                                return MyDrawer(
                                  headerTitle: e.userModel?.name ?? '',
                                );
                              }, failure: (value) {
                                return const SizedBox();
                              });
                            },
                          ),
                          body: SingleChildScrollView(
                            child: Center(
                              child: isLoading
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * .1),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) {
                                            return state.map(
                                              initial: (value) {
                                                return const SizedBox();
                                              },
                                              loading: (value) {
                                                return const SizedBox();
                                              },
                                              success: (value) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Scaffold.of(context)
                                                              .openDrawer();
                                                        },
                                                        child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: const Icon(
                                                                Icons.menu)),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              failure: (value) {
                                                return const SizedBox();
                                              },
                                            );
                                          },
                                        ),
                                        Image.asset(AppAssets.images.wand,
                                            height: size.height * .15),
                                        const SizedBox(height: 15),
                                        TextSize.s56w700(
                                            'Сгенерируй\nзадание на дизайн'),
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
                                              //TODO: Change duration
                                              Future.delayed(const Duration(
                                                      microseconds: 500))
                                                  .then((value) {
                                                setState(() {
                                                  isLoading = false;
                                                  queryNumber =
                                                      Random().nextInt(5);
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
                ),
            unauthenticated: (value) =>
                const Scaffold(body: Text('Не авторизован')));
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.headerTitle, this.children});

  final String headerTitle;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveBuilder.isDesktop(context);

    return SizedBox(
      width: isDesktop ? 300 : 150, // Set the width of the drawer
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: isDesktop ? 200 : 120,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Flexible(
                  child: Text(
                    headerTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isDesktop ? 32 : 18,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Выход'),
              onTap: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
                context.replace('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
