import 'package:flutter/material.dart';

import 'overlapping_stacked_image_flow.dart';

class OverlappingStackedImageConfiguration {
  final int maxImagesToShow;
  final double itemSize;
  final double itemBorderWidth;
  final Color borderColor;
  final bool showsMoreCountLabel;
  final double offsetPercentage;
  final OverlappingStackedImageFlow flow;
  final TextStyle labelStyle;

  const OverlappingStackedImageConfiguration(
      {required this.maxImagesToShow,
      required this.itemSize,
      required this.itemBorderWidth,
      required this.borderColor,
      this.showsMoreCountLabel = true,
      this.offsetPercentage = 0.5,
      this.flow = OverlappingStackedImageFlow.rightToLeft,
      this.labelStyle = const TextStyle(color: Colors.grey, fontSize: 25)});
}
