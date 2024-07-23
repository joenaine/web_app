import 'dart:math';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:desoto_web/application/bloc/profile_bloc.dart';
import 'package:desoto_web/core/constants/app_assets.dart';
import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_internal_variable_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:desoto_web/infrastructure/profile/profile_repository.dart';
import 'package:desoto_web/injection.dart';
import 'package:desoto_web/presentation/common_widgets/app_hide_keyboard_widget.dart';
import 'package:desoto_web/presentation/common_widgets/responsive_builder.dart';
import 'package:desoto_web/presentation/task_generator/task_generator_page.dart';
import 'package:desoto_web/presentation/task_generator/widgets/basic_title_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

import 'widgets/text_fontsize.dart';
// import 'dart:html';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key, this.queryNumber = 0});
  int queryNumber;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  PlatformFile? pickedFile;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  // variable to hold image to be displayed

  Uint8List? uploadedImage;

//method to load image and update `uploadedImage`

  _startFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files?.length == 1) {
        final file = files?[0];
        html.FileReader reader = html.FileReader();

        // reader.onLoadEnd.listen((e) {
        //   setState(() {
        //     uploadedImage = reader.result as Uint8List;
        //   });
        // });

        // reader.onError.listen((fileEvent) {
        //   setState(() {
        //     option1Text = "Some Error occured while reading the file";
        //   });
        // });

        reader.readAsArrayBuffer(file!);
      }
    });
  }

  bool _isVisible = false;

  void updateVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TaskHeader(isTask: true),
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
      body: AppHideKeyBoardWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicTitleTaskWidget(
                  title: 'ТЕМАТИКА ПРОЕКТА',
                  subWidget: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () {
                                    widget.queryNumber = Random().nextInt(5);
                                    setState(() {});
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.refresh, size: 50),
                                  )))),
                      Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () async {
                                    final repo = getIt<ProfileRepository>();

                                    final result = await repo.addTaskToProfile(
                                        userId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        taskId: widget.queryNumber);

                                    result.fold(
                                        (l) => FlushbarHelper.createError(
                                                message: l)
                                            .show(context),
                                        (r) => FlushbarHelper.createSuccess(
                                                message:
                                                    'Добавлено в избранное')
                                            .show(context));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.add, size: 50),
                                  )))),
                    ],
                  ),
                  children: [
                    TextSize.s40w700(
                        AppExamples.taskList[widget.queryNumber].topicTitle,
                        textAlign: TextAlign.start),
                    const SizedBox(height: 20),
                    TextSize.s16w400(
                        AppExamples.taskList[widget.queryNumber].topicSubtitle)
                  ]),
              BasicTitleTaskWidget(title: 'ШРИФТОВАЯ ПАРА', children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            html.window.open(
                                AppExamples.taskList[widget.queryNumber]
                                        .fontList[0].link ??
                                    '',
                                'new tab');
                          },
                          child: Container(
                            width: 240,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.form),
                            child: Column(
                              children: [
                                Text(
                                  'Aa',
                                  style: AppExamples
                                      .taskList[widget.queryNumber]
                                      .fontList[0]
                                      .font
                                      ?.copyWith(fontSize: 40),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 10),
                                TextSize.s14w500(
                                    AppExamples.taskList[widget.queryNumber]
                                            .fontList[0].title ??
                                        '',
                                    color: AppColors.dark),
                                TextSize.s12w400('Для заголовков')
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            html.window.open(
                                AppExamples.taskList[widget.queryNumber]
                                        .fontList[1].link ??
                                    '',
                                'new tab');
                          },
                          child: Container(
                            width: 240,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.form),
                            child: Column(
                              children: [
                                Text(
                                  'Aa',
                                  style: AppExamples
                                      .taskList[widget.queryNumber]
                                      .fontList[1]
                                      .font
                                      ?.copyWith(fontSize: 40),
                                ),
                                const SizedBox(height: 10),
                                TextSize.s14w500(
                                    AppExamples.taskList[widget.queryNumber]
                                            .fontList[1].title ??
                                        '',
                                    color: AppColors.dark),
                                TextSize.s12w400('Для текста')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                TextSize.s14w500(
                    'Подключи эти шрифты к проекту. Можешь скачать по клику на карточки. Но не ориентируйся только на них, ты можешь найти что-то поинтереснее.',
                    textAlign: TextAlign.start)
              ]),
              BasicTitleTaskWidget(title: 'ЦВЕТОВАЯ ГАММА', children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: AppExamples
                                        .taskList[widget.queryNumber]
                                        .colorsCode[i]));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Скопировано')));
                              },
                              child: Container(
                                height: 90,
                                width: 90,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppExamples
                                        .taskList[widget.queryNumber]
                                        .colors[i]),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                TextSize.s14w500(
                    'Используй в дизайне эти цвета. Кликай на них, чтобы скопировать.',
                    textAlign: TextAlign.start)
              ]),
              BasicTitleTaskWidget(
                  title: 'КОНТЕНТ ГЛАВНОЙ СТРАНИЦЫ',
                  children: [
                    AnimatedCrossFade(
                      alignment: Alignment.center,
                      firstChild: SizedBox(
                        height: 300,
                        child: Html(
                          data: AppExamples.taskList[widget.queryNumber]
                              .content, // Replace with your actual HTML content
                        ),
                      ),
                      secondChild: Html(
                        data: AppExamples.taskList[widget.queryNumber]
                            .content, // Replace with your actual HTML content
                      ),
                      crossFadeState: _isVisible
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      child: Text(_isVisible
                          ? 'Свернуть контент'
                          : 'Показать контент полностью'),
                      onPressed: () {
                        updateVisible();
                      },
                    ),
                  ]),
              BasicTitleTaskWidget(
                  title: 'ДОБАВЬТЕ ФАЙЛ ДЛЯ ПРОВЕРКИ ВАШЕЙ РАБОТЫ',
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // selectFile();
                          _startFilePicker();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(4),
                                  dashPattern: const [4, 4],
                                  color: AppColors.primary,
                                  strokeWidth: 2,
                                  child: Container(
                                    color: AppColors.bg,
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Column(
                                      children: [
                                        if (pickedFile != null) ...[
                                          Image.asset(AppAssets.svg.download,
                                              height: 72),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              pickedFile!.name,
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                        if (pickedFile == null) ...[
                                          SvgPicture.asset(
                                            AppAssets.svg.download,
                                            color: AppColors.primary,
                                          ),
                                          const SizedBox(height: 10),
                                          const Text('Добавить файл',
                                              style: AppStyles.s16w400)
                                        ]
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

class TaskHeader extends StatelessWidget implements PreferredSizeWidget {
  const TaskHeader({
    super.key,
    this.isProgress = false,
    this.isTask = false,
    this.isProfile = false,
  });
  final bool? isProgress;
  final bool? isTask;
  final bool? isProfile;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.go('/progress');
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Мой прогресс',
                    style: isProgress! ? AppStyles.s24w700 : AppStyles.s16w500,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  context.go('/auth/taskgenerator');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Технические задания',
                    style: isTask! ? AppStyles.s24w700 : AppStyles.s16w500,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Личный кабинет',
                    style: isProfile! ? AppStyles.s24w700 : AppStyles.s16w500,
                  ),
                ),
              ),
            )
          ],
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1), child: Divider()));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
