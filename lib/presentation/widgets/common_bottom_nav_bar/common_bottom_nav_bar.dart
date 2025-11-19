import 'package:auto_route/auto_route.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:flutter/material.dart';


class CommonBottomNavBar extends StatefulWidget {
  const CommonBottomNavBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    final theme = Theme.of(context).bottomNavigationBarTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 80,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: colors.background,
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.tabsRouter.activeIndex,

            onTap: (index) {
              widget.tabsRouter.setActiveIndex(index);

            },

            selectedLabelStyle: context.typography.bodyMedium?.copyWith(
              color: theme.unselectedItemColor,
            ),
            unselectedLabelStyle: context.typography.bodyMedium?.copyWith(
              color: theme.selectedItemColor,
            ),
            items: [
              for (int i = 0; i < 3; i++) ...[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Icon(Icons.r_mobiledata)
                      ],
                    ),
                  ),
                  label: "items"
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
