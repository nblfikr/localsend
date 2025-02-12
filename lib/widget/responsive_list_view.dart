import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveListView extends StatelessWidget {
  static const defaultMaxWidth = 550.0;
  static const defaultBreakpoints = ScreenBreakpoints(tablet: 600, desktop: 700, watch: 300);

  final double maxWidth;
  final ScrollController? controller;
  final EdgeInsets padding;
  final EdgeInsets desktopPadding;
  final List<Widget> children;

  const ResponsiveListView({
    this.maxWidth = defaultMaxWidth,
    this.controller,
    required this.padding,
    EdgeInsets? tabletPadding,
    required this.children,
    Key? key,
  })  : desktopPadding = tabletPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: ResponsiveBuilder(
            breakpoints: defaultBreakpoints,
            builder: (context, sizingInformation) {
              return Padding(
                padding: sizingInformation.isDesktop ? desktopPadding : padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
