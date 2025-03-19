import 'package:flutter/material.dart';

import 'loading.dart';

class ContainerScaffold extends StatelessWidget {
  final bool? loading;
  final bool? appBar;
  final Color? backgroundColor;
  final Widget child;
  final Widget? leading;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? extendBodyBehindAppBar;
  final bool? extendBody;
  final bool? forceMaterialTransparency;
  final bool? resizeToAvoidBottomInset;
  final bool? automaticallyImplyLeading;
  final Future<void> Function()? onRefresh;
  final double? elevation;
  final Widget? floatingActionButton;

  const ContainerScaffold({
    super.key,
    required this.child,
    this.leading,
    this.appBar,
    this.loading = false,
    this.title,
    this.centerTitle,
    this.actions,
    this.extendBodyBehindAppBar,
    this.forceMaterialTransparency,
    this.extendBody,
    this.resizeToAvoidBottomInset,
    this.automaticallyImplyLeading,
    this.onRefresh,
    this.backgroundColor,
    this.floatingActionButton,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      extendBody: extendBodyBehindAppBar ?? false,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: (appBar ?? true)
          ? AppBar(
              elevation: elevation,
              automaticallyImplyLeading: automaticallyImplyLeading ?? true,
              backgroundColor: Colors.transparent,
              forceMaterialTransparency: forceMaterialTransparency ?? false,
              title: title != null ? Text(title ?? '') : null,
              centerTitle: centerTitle ?? false,
              actions: actions,
              leading: leading,
            )
          : null,
      body: onRefresh != null
          ? RefreshIndicator(
              onRefresh: onRefresh ?? () async {},
              child: Stack(
                children: [
                  child,
                  if (loading!) const LoadingWidget(),
                ],
              ),
            )
          : Stack(
              children: [
                child,
                if (loading!) const LoadingWidget(),
              ],
            ),
    );
  }
}
