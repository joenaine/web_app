abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();
  final String empty = 'assets/images/empty.jpg';
  final String marker = 'assets/images/marker.png';
  final String ticketizi = 'assets/images/ticketizi.png';
  final String wand = 'assets/images/wand.png';
}

class _Svg {
  const _Svg();
  final String copy = 'assets/icons/copy.svg';
  final String checkSuccess = 'assets/icons/check_success.svg';
  final String download = 'assets/icons/download.svg';
}
