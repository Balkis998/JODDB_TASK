import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Style/assets.dart';

class LoadImage extends StatelessWidget {
  final String imageUrl;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  const LoadImage({
    super.key,
    required this.imageUrl,
    this.color,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.imageBuilder,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return imageUrl == null || imageUrl == ''
        ? Container(
            height: height ?? 90,
            width: width ?? 90,
            decoration: decoration ??
                BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              ImageAssets.noImage,
              fit: fit ?? BoxFit.cover,
              color: color,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              maxHeightDiskCache: 300,
              fit: fit,
              height: height ?? 90,
              width: width ?? 90,
              imageBuilder: imageBuilder,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              errorWidget: (context, url, error) {
                return Container(
                  height: height ?? 90,
                  width: width ?? 90,
                  decoration: decoration ??
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: const AssetImage(ImageAssets.noImage),
                            fit: fit,
                          )),
                );
              },
              imageUrl: imageUrl,
            ),
          );
  }
}
