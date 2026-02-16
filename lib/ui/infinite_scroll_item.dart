import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InfiniteScrollItem<T> extends StatefulWidget {
  final List<T> items;
  final bool hasReachedMax;
  final VoidCallback? onLoadMore;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Widget Function(BuildContext context) itemSkeletonBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final ScrollController controller;
  final bool reverse;
  const InfiniteScrollItem({
    super.key,
    required this.items,
    this.hasReachedMax = true,
    this.onLoadMore,
    required this.itemBuilder,
    required this.itemSkeletonBuilder,
    this.separatorBuilder,
    this.padding,
    this.physics,
    required this.controller,
    this.reverse = false,
  });

  @override
  State<InfiniteScrollItem> createState() => _InfiniteScrollItemState();
}

class _InfiniteScrollItemState extends State<InfiniteScrollItem> {
  late ScrollController scrollController = widget.controller;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onLoadMore);
  }

  void onLoadMore() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      widget.onLoadMore?.call();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(onLoadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.items.length + (widget.hasReachedMax ? 0 : 1),
      shrinkWrap: true,
      padding: widget.padding,
      controller: scrollController,
      physics: widget.physics,
      reverse: widget.reverse,
      separatorBuilder: widget.separatorBuilder == null
          ? (context, index) => SizedBox.shrink()
          : widget.separatorBuilder!,
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.items.length && !widget.hasReachedMax) {
          return Skeletonizer(
            enabled: true,
            child: widget.itemSkeletonBuilder(context),
          );
        }

        return widget.itemBuilder(context, index);
      },
    );
  }
}
