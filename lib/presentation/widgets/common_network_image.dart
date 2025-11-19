import 'package:olearistest/presentation/widgets/common_circular_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({
    super.key,
    required this.url,
    this.child,
    required this.height,
    this.width,
    this.borderRadius,
    this.error,
    this.fit,
    this.border,
    this.colorFilter,
  });

  final String url;
  final double height;
  final double? width;
  final Widget? child;
  final BorderRadius? borderRadius;
  final Widget? error;
  final BoxFit? fit;
  final Border? border;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      // fadeInDuration: const Duration(milliseconds: 300),
      // fadeOutDuration: const Duration(milliseconds: 100),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          color: Colors.grey[200],
        ),
        child: const Center(child: CommonCircularIndicator()),
      ),
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
              colorFilter: colorFilter,
            ),
          ),
          child: child,
        );
      },
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          color: Colors.grey[300],
        ),
        alignment: Alignment.center,
        child: this.error ?? const Icon(
          Icons.error_outline,
          color: Colors.grey,
          size: 32,
        ),
      ),
    );
  }
}