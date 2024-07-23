import 'dart:convert';
import 'dart:ui';

import 'package:desoto_web/core/constants/app_internal_variable_const.dart';

class TaskModel {
  final int id;
  final String topicTitle;
  final String topicSubtitle;
  final List<FontModel> fontList;
  final List<Color> colors;
  final List<String> colorsCode;
  final String content;

  TaskModel(
      {required this.id,
      required this.topicTitle,
      required this.topicSubtitle,
      required this.fontList,
      required this.colors,
      required this.colorsCode,
      required this.content});
}
