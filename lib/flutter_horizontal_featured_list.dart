import 'dart:math';

import 'package:flutter/material.dart';

/// {@tool snippet}
/// This is a sample of a [HorizontalFeaturedList] widget.
///
/// ```dart
///           HorizontalFeaturedList(
///             itemColorBuilder: (context, index) => colors[index],
///             itemCount: colors.length,
///             itemBuilder: (BuildContext context, int index) {
///               return Column(
///                 children: [
///                   Row(
///                     children: <Widget>[
///                       Icon(
///                         Icons.face,
///                         size: 24,
///                         color: Colors.black45,
///                       ),
///                       Expanded(
///                         child: Padding(
///                           padding: const EdgeInsets.only(left: 8.0),
///                           child: Text(
///                             '($index) What is Lorem Ipsum?',
///                             style: TextStyle(
///                               fontSize: 16,
///                               fontWeight: FontWeight.w500,
///                             ),
///                           ),
///                         ),
///                       ),
///                     ],
///                   ),
///                   Expanded(
///                     child: Padding(
///                       padding: const EdgeInsets.all(8.0),
///                       child: Text(
///                         '($index) Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
///                         style: TextStyle(
///                           fontSize: 12,
///                         ),
///                       ),
///                     ),
///                   ),
///                 ],
///               );
///             },
///             onPressedItem: () {},
///             onPressedSeeAll: () {},
///             titleText: 'Ongoing Projects',
///             seeAllText: 'See All',
///           )
/// ```
/// {@end-tool}
class HorizontalFeaturedList extends StatefulWidget {
  /// is total height of this widget.
  final double height;

  /// is the [TextStyle] use for <Title>.
  final TextStyle titleTextStyle;

  /// is the [TextStyle] use for <See All>.
  final TextStyle seeAllTextStyle;

  /// <See All> action.
  final Function() onPressedSeeAll;

  /// is the spacing from parent to the left side of <Title>, and from parent to the right side of <See All>, and spacing between <Featured List View> items also.
  final double margin;

  /// is the padding inside each of ListView items.
  final EdgeInsets itemPadding;

  /// is used for pressing animation on ListView items.
  final Color overlayColor;

  /// is the ListView item border radius.
  final BorderRadius itemBorderRadius;

  /// action to navigate to a detail screen.
  final Function() onPressedItem;

  /// See also [ListView.builder]
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// See also [ListView.builder]
  final int itemCount;

  /// build the ListView item background color if needed.
  final Color Function(BuildContext context, int index)? itemColorBuilder;

  /// <Title> text.
  final String titleText;

  /// <See All> button text.
  final String seeAllText;

  /// lets the horizontal [ListView] knows its children size.
  final double? itemWidth;

  /// to run the default animation.
  final Duration animationDuration;

  /// Create a Horizontal Featured List.
  /// This widget contains:
  /// - <Title> is created by [titleText] and [titleTextStyle] at the top-left.
  /// - <See All> text button is created by [seeAllText] and [seeAllTextStyle] at the top-right, it has an [onPressedSeeAll] action helps in navigating to a full listing screen.
  /// - <Featured List View> is created by [itemBuilder], [itemCount] at the bottom.
  ///
  /// This widget has a default design helps you in saving time to create many of same designs.
  /// - It need a [height], this is total height of this widget, lets the [Column] inside knows its children size.
  /// - [margin] : this is the spacing from parent to the left side of <Title>, and from parent to the right side of <See All>, and spacing between <Featured List View> items also.
  /// - Each item in <Featured List View> has a default style with [itemPadding], [overlayColor] is used for pressing animation, [itemBorderRadius] is the border radius, [onPressedItem] to navigate to a detail screen, [itemWidth] lets the horizontal [ListView] knows its children size.
  /// - [itemColorBuilder] : is background color of an item.
  /// - [animationDuration] : to run the default animation :D, use [Duration.zero] if you don't want it.

  const HorizontalFeaturedList({
    Key? key,
    this.height = 165,
    this.titleTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    this.seeAllTextStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    required this.onPressedSeeAll,
    this.margin: 24,
    this.itemPadding: const EdgeInsets.all(12),
    this.overlayColor: const Color(0x1F000000),
    this.itemBorderRadius: const BorderRadius.all(Radius.circular(22)),
    required this.onPressedItem,
    required this.itemBuilder,
    required this.itemCount,
    this.itemColorBuilder,
    required this.titleText,
    required this.seeAllText,
    this.itemWidth,
    this.animationDuration = const Duration(milliseconds: 400),
  }) : super(key: key);
  @override
  _HorizontalFeaturedListState createState() => _HorizontalFeaturedListState();
}

class _HorizontalFeaturedListState extends State<HorizontalFeaturedList>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: widget.margin, right: max(0.0, widget.margin - 12)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.titleText,
                    style: widget.titleTextStyle,
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    widget.seeAllText,
                    style: widget.seeAllTextStyle,
                  ),
                  onPressed: widget.onPressedSeeAll,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(12)),
                    elevation: MaterialStateProperty.all<double>(0.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all<Color>(widget.overlayColor),
                    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.itemCount,
                itemBuilder: (context, index) {
                  final itemWidth = widget.itemWidth ??
                      MediaQuery.of(context).size.width * 0.75;
                  final begin = Offset(-index * 0.95, 0);
                  final firstWeight = 0.5;
                  return SlideTransition(
                    position: TweenSequence<Offset>([
                      TweenSequenceItem<Offset>(
                          tween: Tween<Offset>(
                            begin: begin,
                            end: begin,
                          ),
                          weight: firstWeight),
                      TweenSequenceItem<Offset>(
                          tween: Tween<Offset>(
                            begin: begin,
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.linearToEaseOut)),
                          weight: 1 - firstWeight),
                    ]).animate(_animationController),
                    child: Container(
                      width: itemWidth,
                      margin: EdgeInsets.only(
                          left: index == 0 ? widget.margin : 0,
                          right: widget.margin),
                      child: ElevatedButton(
                        child: widget.itemBuilder(context, index),
                        onPressed: widget.onPressedItem,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: widget.itemBorderRadius)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              widget.itemPadding),
                          elevation: MaterialStateProperty.all<double>(0.0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: MaterialStateProperty.all<Color>(
                              widget.itemColorBuilder != null
                                  ? widget.itemColorBuilder!(context, index)
                                  : Colors.transparent),
                          overlayColor: MaterialStateProperty.all<Color>(
                              widget.overlayColor),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size.zero),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
