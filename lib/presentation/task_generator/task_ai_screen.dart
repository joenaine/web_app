import 'dart:ui';

import 'package:desoto_web/core/constants/app_assets.dart';
import 'package:desoto_web/core/constants/app_colors_const.dart';
import 'package:desoto_web/core/constants/app_internal_variable_const.dart';
import 'package:desoto_web/core/constants/app_styles_const.dart';
import 'package:desoto_web/presentation/common_widgets/app_hide_keyboard_widget.dart';
import 'package:desoto_web/presentation/task_generator/widgets/basic_title_widget.dart';
import 'package:desoto_web/presentation/task_generator/widgets/discolored_button.dart';
import 'package:desoto_web/presentation/task_generator/widgets/text_fontsize.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;
// import 'dart:html';

class TaskAiScreen extends StatefulWidget {
  const TaskAiScreen({super.key, this.aiResponse = '', this.queryNumber = 1});
  final String aiResponse;
  final int queryNumber;

  @override
  State<TaskAiScreen> createState() => _TaskAiScreenState();
}

class _TaskAiScreenState extends State<TaskAiScreen> {
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

  late String aiResponse;
  @override
  void initState() {
    super.initState();
    aiResponse = widget.aiResponse;
  }

  bool _isVisible = false;

  void updateVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('aiRequest $aiResponse');
    return Scaffold(
      body: AppHideKeyBoardWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicTitleTaskWidget(title: 'ТЕМАТИКА ПРОЕКТА', children: [
                TextSize.s40w700(AppExamples.topicTitle[widget.queryNumber],
                    textAlign: TextAlign.start),
                const SizedBox(height: 20),
                // TextSize.s16w400(aiResponse)
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
                                AppExamples
                                        .fontList[widget.queryNumber][0].link ??
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
                                      .fontList[widget.queryNumber][0].font
                                      ?.copyWith(fontSize: 40),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 10),
                                TextSize.s14w500(
                                    AppExamples.fontList[widget.queryNumber][0]
                                            .title ??
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
                                AppExamples
                                        .fontList[widget.queryNumber][1].link ??
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
                                      .fontList[widget.queryNumber][1].font
                                      ?.copyWith(fontSize: 40),
                                ),
                                const SizedBox(height: 10),
                                TextSize.s14w500(
                                    AppExamples.fontList[widget.queryNumber][1]
                                            .title ??
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
                                        .colorsCode[widget.queryNumber][i]));
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
                                        .colors[widget.queryNumber][i]),
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
                    SizedBox(
                        height: _isVisible ? 1150 : 300,
                        child: Html(
                            data: AppExamples.contentList[widget.queryNumber])),
                    ClipRect(
                      clipper:
                          const ClipPad(padding: EdgeInsets.only(top: 300)),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white60,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 500,
                            ),
                            BoxShadow(
                              color: Colors.white60,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 500,
                            ),
                            BoxShadow(
                              color: Colors.white60,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 500,
                            ),
                            BoxShadow(
                              color: Colors.white60,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 500,
                            ),
                            BoxShadow(
                              color: Colors.white60,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 500,
                            ),
                          ],
                        ),
                        child: DiscoloredButton(
                          text: _isVisible
                              ? 'Свернуть контент'
                              : 'Показать контент полностью',
                          onPressed: () {
                            updateVisible();
                          },
                        ),
                      ),
                    )
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

class ClipPad extends CustomClipper<Rect> {
  final EdgeInsets padding;

  const ClipPad({this.padding = EdgeInsets.zero});

  @override
  Rect getClip(Size size) => padding.inflateRect(Offset.zero & size);

  @override
  bool shouldReclip(ClipPad oldClipper) => oldClipper.padding != padding;
}
