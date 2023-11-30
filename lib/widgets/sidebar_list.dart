import 'package:flutter/material.dart';

class SidebarList extends StatelessWidget {
  final List<Widget> children;

  const SidebarList({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}