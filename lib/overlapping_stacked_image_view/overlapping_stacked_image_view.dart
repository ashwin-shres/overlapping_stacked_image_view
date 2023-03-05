import 'package:flutter/material.dart';

import 'overlapping_stacked_image_configuration.dart';
import 'overlapping_stacked_image_flow.dart';

@immutable
class OverlappingStackedImageView extends StatelessWidget {
  final List<String> items;
  final OverlappingStackedImageConfiguration configuration;
  OverlappingStackedImageView(
      {required this.items, required this.configuration, super.key});
  List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    _setUpImages();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: configuration.itemSize,
          width: widthOfView,
          child: Stack(
            children: _getChildren(),
          ),
        ),
        Visibility(
          visible: configuration.showsMoreCountLabel,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 15),
            child: Text(
              _remainingCountText(),
              style: configuration.labelStyle,
            ),
          ),
        )
      ],
    );
  }

  _setUpImages() {
    if (isItemsLessThanMaxToShow) {
      _items = items.sublist(0, items.length);
      return;
    }
    _items = items.sublist(0, configuration.maxImagesToShow);
    switch (configuration.flow) {
      case OverlappingStackedImageFlow.leftToRight:
        _items = _items.reversed.toList();
        break;
      case OverlappingStackedImageFlow.rightToLeft:
        break;
    }
  }

  String _remainingCountText() {
    if (isItemsLessThanMaxToShow) {
      return "";
    }
    return "+ ${items.length - configuration.maxImagesToShow}";
  }

  bool get isItemsLessThanMaxToShow {
    return items.length < configuration.maxImagesToShow;
  }

  double get widthOfView {
    return _items.length == 1
        ? configuration.itemSize
        : (((_items.length - 1) * singleOffset) + configuration.itemSize);
  }

  List<Widget> _getChildren() {
    switch (configuration.flow) {
      case OverlappingStackedImageFlow.leftToRight:
        double offset = -singleOffset;
        int index = -1;
        return _items.map((e) {
          offset += singleOffset;
          index += 1;
          return _imagePositioned(
              leftOffset: 0, rightOffset: offset, index: index);
        }).toList();

      case OverlappingStackedImageFlow.rightToLeft:
        int index = 0;
        return _items.map((e) {
          double offset = singleOffset * index;
          Widget item = _imagePositioned(
              leftOffset: offset,
              rightOffset: singleOffset * (_items.length - index - 1),
              index: index);
          index += 1;
          return item;
        }).toList();
    }
  }

  double get singleOffset {
    return configuration.itemSize * configuration.offsetPercentage;
  }

  Widget _imagePositioned(
      {required double leftOffset,
      required double rightOffset,
      required int index}) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: rightOffset,
      left: leftOffset,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: configuration.borderColor,
                    width: configuration.itemBorderWidth)),
            child: _image(_items[index]),
          ),
        ],
      ),
    );
  }

  Widget _image(String imageUrl) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        height: configuration.itemSize -
            (configuration.itemBorderWidth *
                2.0), // multiplied by 2 as border on 2 sides
        width: configuration.itemSize -
            (configuration.itemBorderWidth *
                2.0), // multiplied by 2 as border on 2 sides
        child: Container(
          color: Colors.white,
          child: Image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
