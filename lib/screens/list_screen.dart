import 'package:flutter/material.dart';
import '../data/wonders_data.dart';
import '../models/item_model.dart';
import '../widgets/app_bar_style.dart';
import '../widgets/card_style.dart';

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
        title: const Text("Wonders of nature"),
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
                  // сдвиг вниз на 30px в начале, потом плавно подниматся на место
                  offset: Offset(0, 30 * (1 - value)),
                  child: WonderCard(wonder: wonder),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
