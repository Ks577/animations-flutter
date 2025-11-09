import 'package:flutter/material.dart';
import 'package:flutter_animations/const/text_style.dart';
import 'package:page_transition/page_transition.dart';
import '../models/item_model.dart';
import '../screens/details_screen.dart';

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

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
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
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: wonder.imageUrl,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
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
                        Center(child: SizedBox(height: 60, width: 60)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: GestureDetector(
                  onTap: _toggle,
                  child: Row(
                    children: [
                      Expanded(child: WonderTitleText(wonder.title)),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: WonderSubtitleText(wonder.subtitle),
                          )
                        : const SizedBox.shrink(key: ValueKey("empty")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
