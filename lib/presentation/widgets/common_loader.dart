import 'package:flutter/material.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key, this.withPadding = false});

  final bool withPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: withPadding ? 120 : 0),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
