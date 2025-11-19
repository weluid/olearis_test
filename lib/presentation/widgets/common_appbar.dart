import 'package:auto_route/auto_route.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:olearistest/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.textTitle,
    this.titleWidget,
    this.leading,
    this.actions,
    this.elevation = false,
    this.actionsVisible = true,
    this.onPressed,
  });

  final String? textTitle;
  final Widget? titleWidget;
  final Widget? leading;
  final Widget? actions;
  final bool elevation;
  final VoidCallback? onPressed;
  final bool actionsVisible;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppBar(
      automaticallyImplyLeading: false,
      title: titleWidget ?? Visibility(
        visible: textTitle != null,
        child: Text(
          textTitle ?? '',
          style: context.typography.headlineSmall?.copyWith(color: Colors.white),
        ),
      ),
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      backgroundColor: colors.accentColor,
      leading:context.router.canPop() ?  leading ??
          IconButton(
            onPressed: onPressed ?? () => context.router.maybePop(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            icon: Assets.icons.arrowLeft.svg(
              width: 34,
              height: 34,
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            splashRadius: 16,
          ) : SizedBox.shrink(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Visibility(
          visible: elevation,
          child: Divider(
            color: colors.borderColor,
            height: 0,
          ),
        ),
      ),
      leadingWidth: 56,
      actions: actions != null ? [actions!] : null,
    );
  }
}
