import 'package:flutter/material.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      alignment: Alignment.center,
      child: Text(title, style: context.typography.titleLarge),
    );
  }
}