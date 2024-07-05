class StructureModel {
  String? title;
  String? subtitle;
  List<FontPairs>? fontPairs;
  ColorCodes? colorCodes;
  String? content;

  StructureModel(
      {this.title,
      this.subtitle,
      this.fontPairs,
      this.colorCodes,
      this.content});

  StructureModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    if (json['fontPairs'] != null) {
      fontPairs = <FontPairs>[];
      json['fontPairs'].forEach((v) {
        fontPairs!.add(FontPairs.fromJson(v));
      });
    }
    colorCodes = json['colorCodes'] != null
        ? ColorCodes.fromJson(json['colorCodes'])
        : null;
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    if (fontPairs != null) {
      data['fontPairs'] = fontPairs!.map((v) => v.toJson()).toList();
    }
    if (colorCodes != null) {
      data['colorCodes'] = colorCodes!.toJson();
    }
    data['content'] = content;
    return data;
  }
}

class FontPairs {
  String? name;
  String? link;

  FontPairs({this.name, this.link});

  FontPairs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['link'] = link;
    return data;
  }
}

class ColorCodes {
  String? primary;
  String? secondary;
  String? accent;
  String? background;
  String? text;

  ColorCodes(
      {this.primary, this.secondary, this.accent, this.background, this.text});

  ColorCodes.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
    accent = json['accent'];
    background = json['background'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    data['accent'] = accent;
    data['background'] = background;
    data['text'] = text;
    return data;
  }
}
