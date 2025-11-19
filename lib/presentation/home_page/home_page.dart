import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearistest/core/extentions/context_extentions.dart';
import 'package:olearistest/core/utils/constants.dart';
import 'package:olearistest/presentation/home_page/widgets/item_tile.dart';
import 'package:olearistest/presentation/home_page/widgets/logo_with_border.dart';
import 'package:olearistest/presentation/widgets/common_appbar.dart';
import 'bloc/home_page_cubit.dart';



@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.items});

  final List<String> items;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final double horizontalPadding;

  @override
  void initState() {
    super.initState();
    horizontalPadding = spacing * 2;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => HomePageCubit(widget.items),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          final cubit = context.read<HomePageCubit>();
          final localItems = cubit.items;

          return Scaffold(
            appBar: CommonAppBar(
              textTitle: l10n.markupTest,
              centerTitle: false,
              actions: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: cubit.removeItem,
                    icon: const Icon(Icons.remove, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: cubit.addItem,
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final tileWidth = (constraints.maxWidth - horizontalPadding - spacing) / 2;
                  final tileHeight = tileWidth / 4.5;
                  final rows = (localItems.length / 2).ceil();

                  final gridHeight = rows == 0
                      ? 0
                      : rows * tileHeight + (rows - 1) * spacing + (spacing * 2);

                  final freeSpace = constraints.maxHeight - gridHeight - (spacing * 2);

                  final logoHeight = (logoSize * 0.42); // logo aspect ratio based on size
                  final totalContentHeight =
                      logoHeight + gridHeight + horizontalPadding + (logoPadding * 2);
                  final needsScroll = totalContentHeight > constraints.maxHeight;

                  return CustomScrollView(
                    physics: needsScroll
                        ? const AlwaysScrollableScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: freeSpace.clamp(logoHeight, double.infinity),
                          child: Center(
                            child: SizedBox(width: logoSize, child: LogoView()),
                          ),
                        ),
                      ),

                      if (localItems.isNotEmpty)
                        SliverPadding(
                          padding: const EdgeInsets.all(12),
                          sliver: SliverGrid(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: spacing,
                              mainAxisSpacing: spacing,
                              childAspectRatio: 4,
                            ),
                            delegate: SliverChildBuilderDelegate((context, index) {
                              return ItemTile(title: localItems[index]);
                            }, childCount: localItems.length),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
