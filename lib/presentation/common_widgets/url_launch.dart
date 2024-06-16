import 'package:url_launcher/url_launcher.dart';

class UrlL {
  static Future<void> openUrl(String url) async {
    final parsUrl = Uri.parse(url);
    if (!await launchUrl(parsUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $parsUrl';
    }
  }

  static Future<void> openUrlInstagram(String url) async {
    final parsUrl = Uri.parse('https://www.instagram.com/$url');
    if (!await launchUrl(parsUrl)) {
      throw 'Could not launch $parsUrl';
    }
  }

  static Future<void> openUrlTelegram(String url) async {
    final parsUrl = Uri.parse('https://www.t.me/$url');
    if (!await launchUrl(parsUrl)) {
      throw 'Could not launch $parsUrl';
    }
  }

  static Future<void> openUrlFacebook(String url) async {
    final parsUrl = Uri.parse('https://www.facebook.com/$url');
    if (!await launchUrl(parsUrl)) {
      throw 'Could not launch $parsUrl';
    }
  }

  static Future<void> openUrlLinkedIn(String url) async {
    final parsUrl = Uri.parse('https://www.linkedin.com/in/$url');
    if (!await launchUrl(parsUrl)) {
      throw 'Could not launch $parsUrl';
    }
  }
}
