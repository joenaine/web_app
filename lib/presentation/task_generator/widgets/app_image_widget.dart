import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget(
      {Key? key, this.path, this.radius = 0, this.boxFit = BoxFit.cover})
      : super(key: key);
  final String? path;
  final double? radius;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InteractiveViewer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: FancyShimmerImage(
            boxFit: boxFit!,
            alignment: Alignment.center,
            // placeholder: (context, loadingProgress) {
            //   return Center(child: AppLoaderWidget());
            // },
            // useOldImageOnUrlChange: true,
            // errorWidget: (context, url, error) => Image.asset(
            //       AppAssets.images.bitmap,
            //       fit: BoxFit.cover,
            //     ),
            errorWidget: const Icon(Icons.cancel),
            imageUrl: path ??
                'https://seminar-bagus.com/wp-content/uploads/2016/01/bg-seminar-bagus.jpg'),
      ),
    );
  }
}
