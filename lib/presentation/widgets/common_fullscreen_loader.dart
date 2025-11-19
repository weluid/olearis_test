import 'dart:ui';
import 'package:olearistest/presentation/widgets/common_circular_indicator.dart';
import 'package:flutter/material.dart';

mixin FullscreenLoaderMixin {
  final _showFullscreenLoader = ValueNotifier<bool>(false);

  bool get showFullscreenLoader => _showFullscreenLoader.value;

  set showFullscreenLoader(bool value) => _showFullscreenLoader.value = value;

  Widget fullscreenLoader({
    bool? showLoader,
    bool showGrayBackground = true,
    bool showBlur = true,
  }) {
    final ValueNotifier<bool> valueListenable = showLoader != null
        ? ValueNotifier<bool>(showLoader)
        : _showFullscreenLoader;
    return ValueListenableBuilder<bool>(
      builder: (_, bool needToShowLoader, Widget? loader) {
        return needToShowLoader ? loader as Widget : const SizedBox();
      },
      valueListenable: valueListenable,
      child: Stack(
        children: [
          if (showGrayBackground) _background(showBlur: showBlur),
          const Center(
            child: CommonCircularIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _background({bool showBlur = true}) {
    if (showBlur) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ColoredBox(
            color: Colors.transparent,
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ColoredBox(
          color: Colors.transparent,
        ),
      );
    }
  }
}
