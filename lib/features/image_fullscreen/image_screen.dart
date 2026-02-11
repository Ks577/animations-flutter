import 'package:flutter/material.dart';
import 'package:flutter_animations/core/responsive/responsive.dart';
import '../../data/wonder_model.dart';

class ImageScreen extends StatelessWidget {
  final Wonder wonders;

  const ImageScreen(this.wonders, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: wonders.imageUrl,
            child: InteractiveViewer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  ResponsiveHelper.radius(context, 0.02),
                ),
                child: Image.network(wonders.imageUrl, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
