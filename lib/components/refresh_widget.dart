import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  final GlobalKey<RefreshIndicatorState>? keyRefresh;
  final Widget child;
  final Future Function() onRefresh;
  final ScrollController? scrollController;
  final bool? alwaysScroll;
  const RefreshWidget({
    Key? key,
    this.keyRefresh,
    required this.child,
    required this.onRefresh,
    this.scrollController,
    this.alwaysScroll,
  }) : super(key: key);

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CustomScrollView(
      controller: widget.scrollController,
      physics: widget.alwaysScroll == false
          ? const BouncingScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        CupertinoSliverRefreshControl(
          key: widget.keyRefresh,
          onRefresh: () async {
            await widget.onRefresh();
          },
        ),
        SliverToBoxAdapter(
          child: widget.child,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ),
      ],
    )
        : RefreshIndicator(
      key: widget.keyRefresh,
      onRefresh: () async {
        await widget.onRefresh();
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        physics: widget.alwaysScroll == false
            ? const BouncingScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        controller: widget.scrollController,
        child: widget.child,
      ),
    );
  }
}
