import 'package:flutter/material.dart';
import 'package:flutter_animations/core/responsive/responsive.dart';
import 'package:flutter_animations/core/theme/app_text_style.dart';
import 'package:page_transition/page_transition.dart';
import '../../data/wonder_model.dart';
import '../wonder_details/details_screen.dart';

class WonderCard extends StatefulWidget {
  final Wonder wonder;

  const WonderCard({super.key, required this.wonder});

  @override
  State<WonderCard> createState() => _WonderCardState();
}

class _WonderCardState extends State<WonderCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  void _toggle() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wonder = widget.wonder;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.topToBottom,
          duration: const Duration(milliseconds: 600),
          child: DetailsScreen(wonder),
        ),
      ),
      child: Card(
        elevation: 6,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ResponsiveHelper.radius(context, 0.05),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: wonder.imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ResponsiveHelper.radius(context, 0.05),
                  ),
                  topRight: Radius.circular(
                    ResponsiveHelper.radius(context, 0.05),
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.gif',
                        image: wonder.imageUrl,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 600),
                        fadeOutDuration: const Duration(milliseconds: 300),
                      ),
                      Center(
                        child: SizedBox(
                          height: ResponsiveHelper.image(context, 0.015),
                          width: ResponsiveHelper.image(context, 0.015),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.pad(context, 0.04),
                vertical: ResponsiveHelper.pad(context, 0.03),
              ),
              child: GestureDetector(
                onTap: _toggle,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        wonder.title,
                        style: AppTextStyle.title(context),
                      ),
                    ),
                    // анимация стрелки
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.expand_more),
                    ),
                  ],
                ),
              ),
            ),
            ClipRect(
              child: SizeTransition(
                // плавное изменение высоты
                sizeFactor: _animation,
                axisAlignment: -1.0,
                child: AnimatedSwitcher(
                  // плавная смена содержимого
                  duration: const Duration(milliseconds: 600),
                  child: isExpanded
                      ? Padding(
                          key: const ValueKey("subtitle"),
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.pad(context, 0.04),
                            vertical: ResponsiveHelper.pad(context, 0.015),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wonder.subtitle,
                                style: AppTextStyle.subtitle(context),
                              ),
                              SizedBox(
                                height: ResponsiveHelper.pad(context, 0.02),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(key: ValueKey("empty")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
