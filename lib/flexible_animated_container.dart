library flexible_animated_container;

import 'package:flutter/material.dart';

/// A custom card widget that can expand and collapse.
///
/// The [FlexableAnimatedContainer] widget provides an animated card with an image and text
/// description. It can expand or collapse based on the [isExpanded] property.
///
/// Example:
/// ```dart
/// CardItem(
///   pictureDescribeText: Text('Beautiful landscape'),
///   imageProvider: NetworkImage('https://example.com/image.jpg'),
///   isExpanded: true,
///   onTap: () => print('Card tapped!'),
///   onDoubleTap: () => print('Card double-tapped!'),
/// );
/// ```
class FlexableAnimatedContainer extends StatefulWidget {
  /// The text widget describing the picture.
  ///
  /// Example: `Text('Beautiful landscape')`
  final Text pictureDescribeText;

  /// The image provider for the card background image.
  ///
  /// Example: `NetworkImage('https://example.com/image.jpg')`
  final ImageProvider imageProvider;

  /// The background color of the card.
  ///
  /// Default is white. You can customize this to any color you prefer.
  final Color backgroundColor;

  /// The border radius of the card.
  ///
  /// Default is 12.0. Adjust this to control the roundness of the card corners.
  final double borderRadius;

  /// The padding around the text inside the card.
  ///
  /// Default is 12.0 on all sides. Modify this to adjust spacing around the text.
  final EdgeInsetsGeometry padding;

  /// Determines whether the card is expanded or collapsed.
  ///
  /// When `true`, the card is expanded. When `false`, the card is collapsed.
  final bool isExpanded;

  /// Callback function when the card is tapped.
  ///
  /// This function is triggered when the card is tapped. Typically used to
  /// toggle the card's expanded/collapsed state.
  final VoidCallback onTap;

  /// Optional callback function for when the card is double-tapped.
  ///
  /// This function is optional and can be used to perform additional actions
  /// when the card is double-tapped.
  final VoidCallback? onDoubleTap;

  /// The duration of the animation.
  ///
  /// Controls how long the animation takes to complete when the card expands
  /// or collapses. Default is 350 milliseconds.
  final Duration animationDuration;

  /// The alignment of the text when the card is expanded.
  ///
  /// Default is `Alignment.bottomCenter`. You can adjust this to position the
  /// text differently when the card is expanded.
  final AlignmentGeometry expandedAlignment;

  /// The alignment of the text when the card is collapsed.
  ///
  /// Default is `Alignment(0.0, 0.6)`. Modify this to change the text's position
  /// when the card is collapsed.
  final AlignmentGeometry collapsedAlignment;

  /// The fit of the image within the card.
  ///
  /// Controls how the image fits inside the card. Default is `BoxFit.cover`.
  /// Other options include `BoxFit.fill`, `BoxFit.fitWidth`, etc.
  final BoxFit imageFit;

  /// Creates a [FlexableAnimatedContainer] widget.
  ///
  /// The [pictureDescribeText], [imageProvider], and [isExpanded] parameters
  /// must not be null.
  const FlexableAnimatedContainer({
    super.key,
    required this.pictureDescribeText,
    required this.imageProvider,
    this.backgroundColor = Colors.white,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(12.0),
    required this.isExpanded,
    required this.onTap,
    this.onDoubleTap,
    this.animationDuration = const Duration(milliseconds: 350),
    this.expandedAlignment = Alignment.bottomCenter,
    this.collapsedAlignment = const Alignment(0.0, 0.6),
    this.imageFit = BoxFit.cover,
  });

  @override
  State<FlexableAnimatedContainer> createState() =>
      _FlexableAnimatedContainerState();
}

class _FlexableAnimatedContainerState extends State<FlexableAnimatedContainer>
    with SingleTickerProviderStateMixin {
  // Controller to manage the animation.
  late AnimationController animationController;

  // Defines how the rotation animation should behave.
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initializes the AnimationController with the provided duration.
    animationController = AnimationController(
      vsync: this, // TickerProvider for animation timing.
      duration: widget.animationDuration,
    );

    // Defines the rotation animation from -0.25 turns to 0.0 turns.
    rotationAnimation =
        Tween<double>(begin: -0.25, end: 0.0).animate(animationController);

    // Starts the animation if the card is initially expanded.
    if (widget.isExpanded) {
      animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant FlexableAnimatedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Animates the card based on whether it is expanded or collapsed.
    if (widget.isExpanded) {
      animationController.forward(); // Expand animation.
    } else {
      animationController.reverse(); // Collapse animation.
    }
  }

  @override
  void dispose() {
    // Disposes of the AnimationController when the widget is removed from the tree.
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Gets the width of the screen.
    final screenWidth = MediaQuery.of(context).size.width;

    // Determines the width and height of the card based on its expanded state.
    final cardWidth = widget.isExpanded ? screenWidth * 0.6 : screenWidth * 0.2;
    final cardHeight =
        widget.isExpanded ? screenWidth * 0.6 : screenWidth * 0.7;

    // Sets the alignment of the text based on the card's expanded state.
    final alignment = widget.isExpanded
        ? widget.expandedAlignment
        : widget.collapsedAlignment;

    return GestureDetector(
      // Calls the onTap callback when the card is tapped.
      onTap: widget.onTap,
      // Calls the onDoubleTap callback when the card is double-tapped.
      onDoubleTap: widget.onDoubleTap,
      child: AnimatedContainer(
        // Sets the height and width of the container based on the card's state.
        height: cardHeight,
        width: cardWidth,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          // Applies background color and border radius.
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.backgroundColor,
        ),
        margin: const EdgeInsets.only(right: 16),
        duration: widget.animationDuration,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Displays the background image.
            Image(
              image: widget.imageProvider,
              fit: widget.imageFit,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            // Animates the alignment and rotation of the text.
            AnimatedAlign(
              duration: widget.animationDuration,
              alignment: alignment,
              child: RotationTransition(
                turns: rotationAnimation,
                child: Padding(
                  padding: widget.padding,
                  child: widget.pictureDescribeText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
