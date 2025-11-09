import 'package:flutter/material.dart';
import 'package:flutter_animations/const/text_style.dart';
import '../models/item_model.dart';
import '../widgets/app_bar_style.dart';
import 'image_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Wonder wonders;

  const DetailsScreen(this.wonders, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(wonders.title),
        centerTitle: true,
        flexibleSpace: const StyleAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 700),
                      pageBuilder: (_, _, _) => ImageScreen(wonders),
                      transitionsBuilder: (_, animation, __, child) {
                        // плавное масштабирование от 0.8 до 1.0
                        final scaleAnimation =
                            Tween<double>(begin: 0.8, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            );
                        return ScaleTransition(
                          scale: scaleAnimation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: wonders.imageUrl,
                  transitionOnUserGestures: true,
                  child: Container(
                    height: 200.0,
                    margin: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(wonders.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: DescriptionText(description: wonders.description),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
