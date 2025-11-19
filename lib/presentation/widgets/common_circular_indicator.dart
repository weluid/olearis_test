import 'package:flutter/material.dart';

class CommonCircularIndicator extends StatelessWidget {
  const CommonCircularIndicator({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
    );
  }
}
