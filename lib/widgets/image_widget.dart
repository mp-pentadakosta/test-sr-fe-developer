import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageWidget extends StatelessWidget {
  final dynamic image;
  final double? height, width;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? loadingColor;
  final Widget? loadingWidget;

  const ImageWidget(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.loadingWidget,
      this.loadingColor,
      this.fit = BoxFit.cover,
      this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    if (image is String) {
      var image = this.image as String;
      if (image.isNotEmpty) {
        if (image.startsWith('http')) {
          BorderRadiusGeometry? borderRadiuss =
              borderRadius ?? BorderRadius.zero;
          return ClipRRect(
            borderRadius: borderRadiuss,
            child: CachedNetworkImage(
              imageUrl: image,
              width: width,
              height: height,
              fit: fit,
              alignment: Alignment.topCenter,
              placeholder: (context, url) {
                return loadingWidget ??
                    Center(
                      child: CircularProgressIndicator(
                        color: loadingColor,
                      ),
                    );
              },
              errorWidget: (context, _, x) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          );
        } else if (image.startsWith('assets')) {
          if (image.endsWith('.json')) {
            return LottieBuilder.asset(
              image,
              height: height,
              width: width,
            );
          }
          BorderRadiusGeometry? borderRadiuss =
              borderRadius ?? BorderRadius.zero;
          return ClipRRect(
            borderRadius: borderRadiuss,
            child: Image.asset(
              image,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        }
      }
    }
    if (image is File) {
      BorderRadiusGeometry? borderRadiuss = borderRadius ?? BorderRadius.zero;
      return ClipRRect(
        borderRadius: borderRadiuss,
        child: Image.file(
          image,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }
    return Icon(
      Icons.image_not_supported_outlined,
      size: width,
    );
  }
}
