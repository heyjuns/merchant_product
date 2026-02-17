import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../domain/domain.dart';

class StatusDotWidget extends StatelessWidget {
  final ProductStatus status;
  const StatusDotWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: .circle,
        color: switch (status) {
          .active => null,
          .draft => context.theme.colors.destructive,
          .unknown => null,
        },
      ),
    );
  }
}
