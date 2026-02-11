import 'package:flutter/material.dart';
import 'package:flutter_animations/core/responsive/responsive.dart';
import '../../data/wonder_data.dart';
import '../../data/wonder_model.dart';
import '../../core/widgets/app_bar_style.dart';
import 'wonder_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<Wonder> wonders = allItems;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wonders of nature",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: const StyleAppBar(),
      ),
      body: ListView.builder(
        itemCount: wonders.length,
        itemBuilder: (context, index) {
          final wonder = wonders[index];
          // плавная анимация карточек
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            // появление карточек по очереди
            duration: Duration(milliseconds: 600 + index * 100),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    ResponsiveHelper.pad(context, 0.075) * (1 - value),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      ResponsiveHelper.pad(context, 0.04),
                    ),
                    child: WonderCard(wonder: wonder),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
