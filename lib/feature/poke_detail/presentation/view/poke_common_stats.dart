import 'package:flutter/material.dart';
import 'package:app/core/extension/context.dart';

class PokeCommonStats extends StatelessWidget {
  const PokeCommonStats({
    super.key,
    required this.value,
    required this.statistic,
  });

  final String value;
  final String statistic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.primaryTextTheme.titleLarge,
        ),
        Text(
          statistic,
          style: context.primaryTextTheme.bodySmall,
        ),
      ],
    );
  }
}
