import 'package:flutter/material.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';

class HabitStatCard extends StatelessWidget {
  const HabitStatCard({
    super.key,
    required this.title,
    required this.currentGoalDays,
    required this.attemptCount,
    required this.recordDays,
    required this.accentColor,
    required this.progress,
    this.onTap,
  });

  final String title;
  final int currentGoalDays;
  final int attemptCount;
  final int recordDays;
  final Color accentColor;
  final double progress; // 0..1
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        strokeWidth: 8,
                        backgroundColor: colors.iconSecondary,
                        valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                      ),
                    ),
                    Icon(Icons.eco, color: colors.text),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: typography.headlineLarge?.copyWith(color: accentColor),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _Stat(label: 'Current goal', value: '$currentGoalDays', suffix: 'days', accentColor: accentColor),
                        _Stat(label: 'Attempt', value: '$attemptCount', accentColor: accentColor),
                        _Stat(label: 'Record', value: '$recordDays', suffix: 'days', accentColor: accentColor),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.label,
    required this.value,
    this.suffix,
    required this.accentColor,
  });

  final String label;
  final String value;
  final String? suffix;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: typography.bodyLarge),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value, style: typography.headlineLarge?.copyWith(color: accentColor)),
            if (suffix != null) ...[
              const SizedBox(width: 4),
              Text(suffix!, style: typography.bodyMedium?.copyWith(color: colors.inactiveColor)),
            ],
          ],
        ),
      ],
    );
  }
}